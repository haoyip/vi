vim.api.nvim_create_autocmd("FileType", { -- Lazy load lazydev when in lua file (no pun intended)
  pattern = "lua",
  callback = function()
    vim.pack.add({
      { src = "https://github.com/folke/lazydev.nvim", name = "lazydev" },
    })
    require("lazydev").setup()
    require("blink.cmp").setup({ -- Reload blink with lazydev as a source
      sources = {
        -- add lazydev to your completion providers
        default = { "lazydev", "lsp", "path", "snippets", "buffer" },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            -- make lazydev completions top priority (see `:h blink.cmp`)
            score_offset = 100,
          },
        },
      },
    })
  end,
})
