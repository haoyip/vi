-- leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
map({ "n", "v" }, " ", "")

-- bracket key
map("n", "<A-n>", "]", { remap = true })
map("n", "<A-p>", "[", { remap = true })

-- save
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save" })
map({ "i", "x", "n", "s" }, "<C-A-S>", "<cmd>noau w<cr><esc>", { desc = "Save without autocommand" })

-- typo helpers
do
  vim.api.nvim_create_user_command("Q", function()
    vim.api.nvim_exec2("q", {})
  end, {})

  vim.api.nvim_create_user_command("W", function()
    vim.api.nvim_exec2("w", {})
  end, {})

  vim.api.nvim_create_user_command("Qw", function()
    vim.api.nvim_exec2("qw", {})
  end, {})

  vim.api.nvim_create_user_command("Qa", function()
    vim.api.nvim_exec2("qa", {})
  end, {})
end

-- view command histories
map("c", "<C-j>", "<Down>")
map("c", "<C-k>", "<Up>")

-- after yanking in visual mode, stay on cursor
map("v", "y", "ygv<Esc>")

-- comments
map("v", "<A-/>", "gcj", { remap = true })
map("n", "<A-/>", "gccj", { remap = true })
map("i", "<A-/>", "<Esc>gccji", { remap = true })

-- duplicate line, comments old line, keep cursor position
map("v", "<A-S-/>", "<Esc>mzyygccp`z:delmarks z<cr>jV", { remap = true })
map("n", "<A-S-/>", "mzyygccp`z:delmarks z<cr>j", { remap = true })
map("i", "<A-S-/>", "<Esc>mzyygccp`z:delmarks z<cr>ja", { remap = true })

-- select all, copy, paste
map({ "n" }, "<leader><C-a>", "ggVG", { desc = "Selet all" })
map({ "n" }, "<C-c>", '"+yy', { desc = "Copy to system clipboard" })
map({ "v" }, "<C-c>", '"+ygv<Esc>', { desc = "Copy to system clipboard" })
map({ "n", "v" }, "<C-v>", '"+p', { desc = "Paste from system clipboard" })
map({ "i" }, "<C-v>", '<esc>"+pa', { desc = "Paste from system clipboard" })
map({ "c" }, "<C-v>", "<C-r>+", { desc = "Paste from system clipboard" })

--  rebind v-block
map({ "n", "v" }, "<leader>v", "<C-v>", { desc = "v-block" })

-- insert mode delete motion
map("i", "<C-l>", "<Del>", { desc = "Delete a character after the cursor" })
map("i", "<C-w>", "<esc>ldwi", { desc = "Delete a word after the cursor" })
map("i", "<C-d>", "<esc>ldbi", { desc = "Delete a word before the cursor" })

-- change inner word
map("n", "<A-c>", "ciw", { desc = "Change inner Word" })
map("n", "<A-C>", "ciW", { desc = "Change inner WORD" })

-- select inner word
map("n", "<A-v>", "viw", { desc = "Select inner Word" })
map("n", "<A-V>", "viW", { desc = "Select inner WORD" })

-- delete line
map("n", "<A-x>", "dd", { desc = "Delete line" })

-- quick navigate
map({ "n", "v" }, "H", "^", { remap = true })
map({ "n", "v" }, "L", "$", { remap = true })

-- center screeen after page up/down
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- without this, <C-i> becomes <Tab>
map("n", "<C-i>", "<C-i>", { desc = "Jump to newer position" })

-- search within visual selection
map("x", "/", "<Esc>/\\%V")

-- open file explorer on root dir
map("n", "<leader>fo", ":!xdg-open .<cr>", { desc = "Open File Explorer on Root Dir" })

-- open file explorer on current buffer
map("n", "<leader>fO", ":!xdg-open %:p:h<cr>", { desc = "Open File Explorer on Current Buffer" })

-- scroll up down faster
map("n", "<C-E>", "3<C-E>")
map("n", "<C-Y>", "3<C-Y>")

-- visual lines instead of logical lines on wrap
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- move Lines
map("n", "<C-S-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<C-S-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("i", "<C-S-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<C-S-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<C-S-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<C-S-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- clear search on escape
map({ "i", "n", "s" }, "<esc>", function()
  vim.cmd("noh")
  return "<esc>"
end, { expr = true, desc = "Escape and Clear hlsearch" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- keywordprg
map("n", "<leader>m", "<cmd>norm! K<cr>", { desc = "Keywordprg" })

-- visual mode indentation keep the selection active
map("x", "<", "<gv")
map("x", ">", ">gv")
