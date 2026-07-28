vim.pack.add({
  { src = "https://github.com/folke/snacks.nvim" },
})

require("snacks").setup({
  dashboard = {
    enabled = true,

    preset = {
      header = "",

      keys = {
        { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
        { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
        { icon = " ", key = "/", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
        { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
        {
          icon = " ",
          key = "s",
          desc = "Restore Session",
          action = ":lua require('persistence').load({ last = true })",
        },
        { icon = " ", key = "q", desc = "Quit", action = ":qa" },
      },
    },

    sections = {
      { section = "keys", gap = 1, padding = 1 },
    },
  },

  picker = {
    enabled = true,

    win = {
      input = {
        keys = {
          ["<C-c>"] = { "disabled" },
          ["<C-v>"] = { "disabled" },

          ["<C-w>"] = { "edit_vsplit", mode = { "i", "n" } },

          -- Alt must be lowercase <a-j> not <A-j>
          ["<a-j>"] = { "list_down", mode = { "i", "n" } },
          ["<a-k>"] = { "list_up", mode = { "i", "n" } },
        },
      },
    },
  },

  indent = { enabled = true },
  bigfile = { enabled = true },
  quickfile = { enabled = true },

  words = {
    enabled = true,
    debounce = 50,
  },

  statuscolumn = {
    enabled = true,
    folds = {
      open = true,
      git_hl = true,
    },
  },
})

vim.g.snacks_animate = false

-- stylua: ignore start

-- picker
map("n", "<leader>k", function() Snacks.picker.files({}) end, { desc = "Picker: Files" })
map("n", "<leader>/", function() Snacks.picker.grep({}) end, { desc = "Picker: Grep" })
map("n", "<leader>uC", function() Snacks.picker.colorschemes({}) end, { desc = "Picker: Colorschemes" })
map("n", "<leader>bb", function() Snacks.picker.buffers({}) end, { desc = "Picker: Buffers" })

-- toggle
Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
Snacks.toggle.profiler_highlights():map("<leader>dph")
Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
Snacks.toggle.diagnostics():map("<leader>ud")
Snacks.toggle.line_number():map("<leader>ul")
Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2, name = "Conceal Level" }):map("<leader>uc")
Snacks.toggle.option("showtabline", { off = 0, on = vim.o.showtabline > 0 and vim.o.showtabline or 2, name = "Tabline" }):map("<leader>uA")
Snacks.toggle.treesitter():map("<leader>uT")
Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
Snacks.toggle.dim():map("<leader>uD")
Snacks.toggle.indent():map("<leader>ug")
Snacks.toggle.profiler():map("<leader>dpp")
Snacks.toggle.inlay_hints():map("<leader>uh")
Snacks.toggle.zen():map("<leader>uz")

-- git
map("n", "<leader>gl", function()
  local cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1]

  if cwd then
    Snacks.picker.git_log({ cwd = cwd })
  else
    Snacks.picker.git_log()
  end
end, { desc = "Git Log" })
map("n", "<leader>gL", function() Snacks.picker.git_log() end, { desc = "Git Log (cwd)" })
map("n", "<leader>gb", function() Snacks.picker.git_log_line() end, { desc = "Git Blame Line" })
map("n", "<leader>gf", function() Snacks.picker.git_log_file() end, { desc = "Git Current File History" })
map({ "n", "x" }, "<leader>gB", function() Snacks.gitbrowse() end, { desc = "Git Browse (open)" })
map({"n", "x" }, "<leader>gY", function()
  Snacks.gitbrowse({ open = function(url) vim.fn.setreg("+", url) end, notify = false })
end, { desc = "Git Browse (copy)" })
