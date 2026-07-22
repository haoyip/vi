vim.lsp.config["tofu_ls"] = {
  filetypes = {
    "opentofu",
    "opentofu-vars",
    "terraform",
    "terraform-vars",
  },
}

vim.lsp.enable("tofu_ls")
