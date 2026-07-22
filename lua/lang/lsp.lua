vim.pack.add({
  { src = "https://github.com/neovim/nvim-lspconfig" },
})

-- keymaps
map({ "n", "v", "i" }, "<A-,>", vim.lsp.buf.signature_help, { desc = "Show signature help" })
map({ "n", "v", "i" }, "<A-.>", vim.lsp.buf.hover, { desc = "Show hover" })

map("n", "gd", vim.lsp.buf.definition, { desc = "To definition" })
map("n", "g/", vim.lsp.buf.references, { desc = "To References" })

map("n", "<leader>l", "<cmd>checkhealth vim.lsp<cr>", { desc = "LSP Info" })

-- highlight
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp-attach-highlight", { clear = true }),
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)

    if not client then
      return
    end

    if client:supports_method("textDocument/documentHighlight") then
      local highlight_augroup = vim.api.nvim_create_augroup("lsp-document-highlight", { clear = false })

      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        group = highlight_augroup,
        buffer = event.buf,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
        group = highlight_augroup,
        buffer = event.buf,
        callback = vim.lsp.buf.clear_references,
      })
    end
  end,
})

-- other lsps
vim.lsp.enable("nil_ls")
vim.lsp.enable("tombi")
