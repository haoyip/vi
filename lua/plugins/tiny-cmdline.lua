vim.pack.add({
  { src = "https://github.com/rachartier/tiny-cmdline.nvim" },
})

require("tiny-cmdline").setup()
require("vim._core.ui2").enable({})

vim.opt.cmdheight = 0
