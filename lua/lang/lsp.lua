vim.pack.add({
  { src = "https://github.com/neovim/nvim-lspconfig" },
})

-- keymaps
map({ "n", "v", "i" }, "<A-,>", vim.lsp.buf.signature_help, { desc = "Show signature help" })
map({ "n", "v", "i" }, "<A-.>", vim.lsp.buf.hover, { desc = "Show hover" })

map("n", "gd", vim.lsp.buf.definition, { desc = "To definition" })
map("n", "g/", vim.lsp.buf.references, { desc = "To references" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "To implementation" })

map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
map("n", "<leader>cl", "<cmd>checkhealth vim.lsp<cr>", { desc = "LSP Info" })

-- other lsps
vim.lsp.enable("nil_ls")
vim.lsp.enable("tombi")
