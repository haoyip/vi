vim.pack.add({
  { src = "https://github.com/folke/todo-comments.nvim" },
})

require("todo-comments").setup({})

map("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next Todo Comment" })

map("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous Todo Comment" })

map("n", "<leader>xt", "<cmd>Trouble todo toggle focus<CR>", {
  desc = "Todo (Trouble)",
})
