vim.pack.add({
  { src = "https://github.com/saghen/blink.cmp" },
  { src = "https://github.com/saghen/blink.lib" },
  { src = "https://github.com/rafamadriz/friendly-snippets" },
})

require("blink.cmp").setup({
  fuzzy = { implementation = "lua" },

  signature = {
    enabled = false,
  },

  completion = {
    trigger = {
      show_on_insert = true,
      show_on_trigger_character = true,
      show_on_keyword = true,
      show_on_backspace = true,
    },
    list = {
      selection = {
        preselect = false,
        auto_insert = true,
      },
    },
    menu = {
      auto_show = true,
      border = "rounded",
      min_width = 35,
      auto_show_delay_ms = 100,
    },
  },

  -- Keymaps
  keymap = {
    preset = "enter",

    ["<C-e>"] = { "scroll_documentation_down", "fallback" },
    ["<C-y>"] = { "scroll_documentation_up", "fallback" },

    ["<A-j>"] = {
      function(cmp)
        cmp.show()
      end,
      "select_next",
      "fallback",
    },
    ["<A-k>"] = {
      function(cmp)
        cmp.show()
      end,
      "select_prev",
      "fallback",
    },

    ["<A-h>"] = { "hide", "fallback" },
    ["<A-l>"] = { "select_and_accept", "fallback" },

    ["<CR>"] = {},

    ["<A-i>"] = {
      function(cmp)
        cmp.show({ providers = { "lsp" } })
      end,
    },

    ["<A-o>"] = {
      function(cmp)
        cmp.show({ providers = { "snippets" } })
      end,
    },
  },

  cmdline = {
    enabled = true,

    keymap = {
      preset = "none",

      ["<A-j>"] = {
        "select_next",
        function(cmp)
          cmp.show({ providers = { "cmdline" } })
        end,
      },

      ["<A-k>"] = {
        "select_prev",
        function(cmp)
          cmp.show({ providers = { "cmdline" } })
        end,
      },

      ["<A-h>"] = { "cancel" },
      ["<A-l>"] = { "accept" },

      ["<Tab>"] = {
        "select_next",
        function(cmp)
          cmp.show({ providers = { "cmdline" } })
        end,
      },

      ["<S-Tab>"] = {
        "select_prev",
        function(cmp)
          cmp.show({ providers = { "cmdline" } })
        end,
      },
    },
  },

  sources = {
    default = {
      "lsp", -- (Equivalent to cmp-nvim-lsp)
      "snippets", -- (Handled by the snippets config, replaces cmp_luasnip source)
      "buffer", -- (Equivalent to cmp-buffer)
      "path", -- (Equivalent to cmp-path)
    },
  },
})
