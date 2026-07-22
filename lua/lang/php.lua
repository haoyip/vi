vim.lsp.config["phpantom"] = {
  cmd = { "phpantom_lsp" },
  filetypes = { "php" },
  root_markers = { "composer.json", ".git" },
}

vim.lsp.enable("phpantom")
