vim.pack.add({
  { src = "https://github.com/b0o/SchemaStore.nvim" },
})

vim.lsp.config("yamlls", {
  capabilities = {
    textDocument = {
      foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      },
    },
  },

  settings = {
    redhat = {
      telemetry = {
        enabled = false,
      },
    },

    yaml = {
      keyOrdering = false,

      format = {
        enable = true,
      },

      validate = true,

      schemaStore = {
        -- Disable yamlls built-in schema fetching
        -- because SchemaStore.nvim provides schemas
        enable = false,
        -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
        url = "",
      },

      schemas = require("schemastore").yaml.schemas(),
    },
  },
})

vim.lsp.enable("yamlls")
