vim.pack.add({
  { src = "https://github.com/mfussenegger/nvim-lint" },
})

require("lint").linters_by_ft = {
  dockerfile = { "hadolint" },
  markdown = { "markdownlint-cli2" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
