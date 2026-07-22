vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", branch = "main" },
})

require("nvim-treesitter").setup({
  highlight = { enable = true },
  indent = { enable = true },
  folds = { enable = true },
})

vim.api.nvim_create_autocmd("FileType", {
  callback = function(ev)
    pcall(vim.treesitter.start, ev.buf)
  end,
})

vim.opt.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

require("nvim-treesitter").install({
  "bash",
  "blade",
  "c",
  "css",
  "dart",
  "dockerfile",
  "fish",
  "git_config",
  "gitcommit",
  "gitignore",
  "html",
  "javascript",
  "json5",
  "just",
  "kdl",
  "lua",
  "markdown",
  "nix",
  "php",
  "php_only",
  "phpdoc",
  "python",
  "query",
  "rust",
  "ron",
  "sql",
  "ssh_config",
  "terraform",
  "toml",
  "typescript",
  "vim",
  "vimdoc",
  "vue",
  "yaml",
})

-- treesitter node incremental selections
map({ "n", "x", "o" }, "<A-o>", function()
  if vim.treesitter.get_parser(nil, nil, { error = false }) then
    require("vim.treesitter._select").select_parent(vim.v.count1)
  else
    vim.lsp.buf.selection_range(vim.v.count1)
  end
end, { desc = "Select parent treesitter node or outer incremental lsp selections" })

map({ "n", "x", "o" }, "<A-i>", function()
  if vim.treesitter.get_parser(nil, nil, { error = false }) then
    require("vim.treesitter._select").select_child(vim.v.count1)
  else
    vim.lsp.buf.selection_range(-vim.v.count1)
  end
end, { desc = "Select child treesitter node or inner incremental lsp selections" })
