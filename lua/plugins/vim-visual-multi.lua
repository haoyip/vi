vim.pack.add({
  { src = "https://github.com/mg979/vim-visual-multi", branch = "master" },
})

map("n", "<A-j>", "<C-down>", { remap = true })
map("n", "<A-k>", "<C-up>", { remap = true })
