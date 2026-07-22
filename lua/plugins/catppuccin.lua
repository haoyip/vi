vim.pack.add({
  { src = "https://github.com/catppuccin/nvim" },
})

require("catppuccin").setup({
  transparent_background = false, -- disables setting the background color.

  float = {
    transparent = false, -- enable transparent floating windows
    solid = false, -- use solid styling for floating windows, see |winborder|
  },

  show_end_of_buffer = true, -- shows the '~' characters after the end of buffers

  lsp_styles = {
    underlines = {
      errors = { "undercurl" },
      hints = { "undercurl" },
      warnings = { "undercurl" },
      information = { "undercurl" },
    },
  },

  integrations = {
    blink_cmp = true,
    flash = true,
    gitsigns = true,
    grug_far = true,
    lsp_trouble = true,
    mini = true,
    snacks = true,
    treesitter_context = true,
    which_key = true,
    yazi = true,
  },
})

vim.cmd.colorscheme("catppuccin-frappe")
