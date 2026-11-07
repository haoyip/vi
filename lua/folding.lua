map("n", "<A-e>", "zc", { desc = "Close fold under cursor" })
map("n", "<A-r>", "zo", { desc = "Open fold under cursor" })

vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldtext = ""
vim.opt.foldcolumn = "0"
vim.opt.fillchars:append({ fold = " " })
vim.opt.foldmethod = vim.env.NVIM_LIGHT == "1" and "indent" or "expr"

if vim.env.NVIM_LIGHT ~= "1" then
  -- Default to treesitter folding
  vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

  -- Prefer LSP folding if client supports it
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if client:supports_method("textDocument/foldingRange") then
        local win = vim.api.nvim_get_current_win()
        vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
      end
    end,
  })
end
