vim.pack.add({
  { src = "https://github.com/folke/flash.nvim" },
})

-- stylua: ignore start

map({ "n", "x", "o" }, "s", function() require("flash").jump() end, { desc = "Flash" })
map({ "n", "x", "o" }, "S", function() require("flash").treesitter() end, { desc = "Flash Treesitter" })
