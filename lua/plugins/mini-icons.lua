vim.pack.add({
  { src = "https://github.com/nvim-mini/mini.icons" },
})

require("mini.icons").setup()

-- Compatibility layer for plugins expecting nvim-web-devicons
require("mini.icons").mock_nvim_web_devicons()
