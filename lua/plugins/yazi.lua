vim.pack.add({
  { src = "https://github.com/mikavilpas/yazi.nvim" },
  { src = "https://github.com/nvim-lua/plenary.nvim" },
})

-- Disable netrw
vim.g.loaded_netrwPlugin = 1

require("yazi").setup({
  open_for_directories = true,

  floating_window_scaling_factor = 1,

  hooks = {
    before_opening_window = function(_)
      vim.fn.setenv("YAZI_CWD", vim.fn.getcwd())
    end,
  },

  keymaps = {
    show_help = "<c-h>",
    open_file_in_vertical_split = "<c-w>",
    open_file_in_tab = "<c-t>",
    replace_in_directory = "<c-g>",
    cycle_open_buffers = "<tab>",
    copy_relative_path_to_selected_files = "<c-y>",
    send_to_quickfix_list = "<c-q>",
    change_working_directory = "<c-\\>",
    open_and_pick_window = "<c-o>",
  },
})

map({ "n", "v" }, "-", "<cmd>Yazi<CR>", { desc = "Open yazi at the current file" })
map({ "n", "v" }, "=", "<cmd>Yazi cwd<CR>", { desc = "Open the file manager in nvim's working directory" })
map("n", "<leader>-", "<cmd>Yazi toggle<CR>", { desc = "Resume the last yazi session" })
