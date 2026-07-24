vim.pack.add({
  { src = "https://github.com/nvim-lualine/lualine.nvim" },
})

require("lualine").setup({
  options = {
    theme = "auto",
    globalstatus = true,
    component_separators = { left = "", right = "" },
  },

  sections = {
    lualine_a = {
      "mode",
    },

    lualine_b = {
      "branch",
    },

    lualine_c = {
      {
        function()
          local reg = vim.fn.reg_recording()

          if reg == "" then
            return ""
          end

          return "MACRO " .. reg
        end,
        color = "DiagnosticWarn",
        padding = {
          left = 1,
          right = 0,
        },
      },

      {
        "filetype",
        icon_only = true,
        separator = "",
        padding = {
          left = 1,
          right = 0,
        },
      },

      {
        "filename",
        path = 1,
        padding = {
          left = 0,
          right = 0,
        },
      },
      {
        "diagnostics",
        symbols = {
          error = " ",
          warn = " ",
          info = " ",
          hint = "󰌵 ",
        },
      },
    },

    lualine_x = {
      {
        "lsp_status",
      },

      {
        "diff",
        symbols = {
          added = "+",
          modified = "~",
          removed = "-",
        },
      },
    },

    lualine_y = {
      {
        "searchcount",
        padding = {
          left = 1,
          right = 0,
        },
      },

      {
        "location",
        padding = {
          left = 0,
          right = 1,
        },
      },
    },

    lualine_z = {
      { "tabs" },
    },
  },
})

vim.opt.showtabline = 0
