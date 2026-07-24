vim.pack.add({
  { src = "https://github.com/MagicDuck/grug-far.nvim" },
})

require("grug-far").setup({
  headerMaxWidth = 80,
})

map({ "n", "x" }, "<leader>sr", function()
  local grug = require("grug-far")
  local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
  grug.open({
    transient = true,
    prefills = {
      filesFilter = ext and ext ~= "" and "*." .. ext or nil,
    },
  })
end, { desc = "GrugFar" })

map({ "x" }, "<leader>si", function()
  require("grug-far").open({ visualSelectionUsage = "operate-within-range" })
end, { desc = "GrugFarWithin" })
