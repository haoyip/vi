vim.pack.add({
  { src = "https://github.com/folke/flash.nvim" },
})

-- stylua: ignore start

map({ "n", "x", "o" }, "s", function() require("flash").jump() end, { desc = "Flash" })

if vim.env.NVIM_LIGHT ~= "1" then
  map({ "n", "x", "o" }, "S", function() require("flash").treesitter() end, { desc = "Flash Treesitter" })
end
