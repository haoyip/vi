vim.pack.add({
  "https://github.com/Saecki/crates.nvim",
  "https://github.com/mrcjkb/rustaceanvim",
})

vim.lsp.enable("bacon_ls")
vim.lsp.enable("rust_analyzer", false)

require("crates").setup({
  completion = {
    crates = {
      enabled = true,
    },
  },

  lsp = {
    enabled = true,
    actions = true,
    completion = true,
    hover = true,
  },
})

vim.g.rustaceanvim = {
  server = {
    on_attach = function(_, bufnr)
      map("n", "<leader>cR", function()
        vim.cmd.RustLsp("codeAction")
      end, {
        desc = "Code Action",
        buffer = bufnr,
      })

      map("n", "<leader>dr", function()
        vim.cmd.RustLsp("debuggables")
      end, {
        desc = "Rust Debuggables",
        buffer = bufnr,
      })
    end,

    default_settings = {
      ["rust-analyzer"] = {

        -- use bacon-ls
        enabled = false,

        cargo = {
          allFeatures = true,
          loadOutDirsFromCheck = true,

          buildScripts = {
            enable = true,
          },
        },

        checkOnSave = true,

        diagnostics = {
          enable = true,
        },

        procMacro = {
          enable = true,
        },

        files = {
          exclude = {
            ".direnv",
            ".git",
            ".jj",
            ".github",
            ".gitlab",
            "bin",
            "node_modules",
            "target",
            "venv",
            ".venv",
          },

          watcher = "client",
        },
      },
    },
  },
}
