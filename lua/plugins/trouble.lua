vim.pack.add({
  { src = "https://github.com/folke/trouble.nvim" },
})

local trouble = require("trouble")

trouble.setup({
  modes = {
    lsp = {
      win = { position = "right" },
    },
  },
})

map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", {
  desc = "Diagnostics (Trouble)",
})

map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", {
  desc = "Buffer Diagnostics (Trouble)",
})

map("n", "<leader>cs", "<cmd>Trouble symbols toggle<cr>", {
  desc = "Symbols (Trouble)",
})

map("n", "<leader>cS", "<cmd>Trouble lsp toggle<cr>", {
  desc = "LSP references/definitions/... (Trouble)",
})

map("n", "<leader>xi", "<cmd>Trouble loclist toggle<cr>", {
  desc = "Location List (Trouble)",
})

map("n", "<leader>xo", "<cmd>Trouble qflist toggle<cr>", {
  desc = "Quickfix List (Trouble)",
})

map("n", "[o", function()
  if trouble.is_open() then
    trouble.prev({
      skip_groups = true,
      jump = true,
    })
  else
    local ok, err = pcall(vim.cmd.cprev)
    if not ok then
      vim.notify(err, vim.log.levels.ERROR)
    end
  end
end, {
  desc = "Previous Trouble/Quickfix Item",
})

map("n", "]o", function()
  if trouble.is_open() then
    trouble.next({
      skip_groups = true,
      jump = true,
    })
  else
    local ok, err = pcall(vim.cmd.cnext)
    if not ok then
      vim.notify(err, vim.log.levels.ERROR)
    end
  end
end, {
  desc = "Next Trouble/Quickfix Item",
})
