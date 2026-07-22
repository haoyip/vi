vim.pack.add({
  { src = "https://github.com/stevearc/conform.nvim" },
})

require("conform").setup({
  formatters_by_ft = {
    fish = { "fish_indent" },
    javascript = { "oxfmt" },
    json = { "oxfmt" },
    jsonc = { "oxfmt" },
    lua = { "stylua" },
    nix = { "alejandra" },
    php = { "pint" },
    rust = { "rustfmt" },
    sh = { "shfmt" },
    typescript = { "oxfmt" },
    vue = { "oxfmt" },
    xml = { "xmlformat" },
    ["markdown"] = { "prettier", "markdownlint-cli2", "markdown-toc" },
    ["markdown.mdx"] = { "prettier", "markdownlint-cli2", "markdown-toc" },
  },
  formatters = {
    ["markdown-toc"] = {
      condition = function(_, ctx)
        for _, line in ipairs(vim.api.nvim_buf_get_lines(ctx.buf, 0, -1, false)) do
          if line:find("<!%-%- toc %-%->") then
            return true
          end
        end
      end,
    },
    ["markdownlint-cli2"] = {
      condition = function(_, ctx)
        local diag = vim.tbl_filter(function(d)
          return d.source == "markdownlint"
        end, vim.diagnostic.get(ctx.buf))
        return #diag > 0
      end,
    },
  },
  format_on_save = true,
  timeout_ms = 3000,
})

map({ "n", "v" }, "<A-f>", function()
  require("conform").format({ lsp_format = "fallback" })
end, { desc = "Format" })
