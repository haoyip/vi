-- quick switch window
map("n", "<Tab>", "<C-w>w", { desc = "Switch Window" })

-- move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- resize window using <ctrl> arrow keys
map("n", "<C-A-k>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-A-j>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-A-l>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-A-h>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
