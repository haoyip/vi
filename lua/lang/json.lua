vim.pack.add({
  { src = "https://github.com/b0o/SchemaStore.nvim" },
})

vim.lsp.config("jsonls", {
  settings = {
    json = {
      format = {
        enable = true,
      },
      validate = {
        enable = true,
      },
      schemas = require("schemastore").json.schemas(),
    },
  },
})

vim.lsp.enable("jsonls")
