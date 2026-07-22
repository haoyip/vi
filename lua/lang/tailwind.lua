vim.pack.add({
  { src = "https://github.com/roobert/tailwindcss-colorizer-cmp.nvim" },
})

require("tailwindcss-colorizer-cmp").setup()

vim.lsp.enable("tailwindcss")
