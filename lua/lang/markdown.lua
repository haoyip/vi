vim.pack.add({
  "https://github.com/iamcco/markdown-preview.nvim",
  "https://github.com/MeanderingProgrammer/render-markdown.nvim",
})

vim.lsp.enable("marksman")

vim.fn["mkdp#util#install"]()

require("render-markdown").setup({
  code = {
    sign = false,
    width = "block",
    right_pad = 1,
  },

  heading = {
    sign = false,
    icons = {},
  },

  checkbox = {
    enabled = false,
  },
})

map("n", "<leader>um", function()
  require("render-markdown").toggle()
end, {
  desc = "Toggle Render Markdown",
})
