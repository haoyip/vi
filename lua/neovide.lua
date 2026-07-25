if not vim.g.neovide then
  return
end

local base_font_size = 11
local current_font_size = base_font_size

local base_tracking = -1
local current_tracking = base_tracking

function IncreaseFontSize()
  SetFont(current_font_size + 1, current_tracking)
end

function DecreaseFontSize()
  SetFont(current_font_size - 1, current_tracking)
end

function IncreaseTracking()
  SetFont(current_font_size, current_tracking + 0.5)
end

function DecreaseTracking()
  SetFont(current_font_size, current_tracking - 0.5)
end

function SetFont(size, tracking)
  current_font_size = size
  current_tracking = tracking
  vim.opt.guifont = "Maple Mono NF:h" .. current_font_size .. ":w" .. current_tracking
  vim.opt.linespace = -1
end

map({ "n", "v", "c" }, "<C-=>", ":lua IncreaseFontSize()<CR>")
map({ "n", "v", "c" }, "<C-->", ":lua DecreaseFontSize()<CR>")
map({ "n", "v", "c" }, "<C-ScrollWheelUp>", ":lua IncreaseFontSize()<CR>")
map({ "n", "v", "c" }, "<C-ScrollWheelDown>", ":lua DecreaseFontSize()<CR>")
map({ "i" }, "<C-=>", "<esc>:lua IncreaseFontSize()<CR>a")
map({ "i" }, "<C-->", "<esc>:lua DecreaseFontSize()<CR>a")
map({ "i" }, "<C-ScrollWheelUp>", "<esc>:lua IncreaseFontSize()<CR>a")
map({ "i" }, "<C-ScrollWheelDown>", "<esc>:lua DecreaseFontSize()<CR>a")

map({ "n", "v", "c" }, "<C-A-=>", ":lua IncreaseTracking()<CR>")
map({ "n", "v", "c" }, "<C-A-->", ":lua DecreaseTracking()<CR>")
map({ "n", "v", "c" }, "<C-A-ScrollWheelUp>", ":lua IncreaseTracking()<CR>")
map({ "n", "v", "c" }, "<C-A-ScrollWheelDown>", ":lua DecreaseTracking()<CR>")
map({ "i" }, "<C-A-=>", "<esc>:lua IncreaseTracking()<CR>a")
map({ "i" }, "<C-A->", "<esc>:lua DecreaseTracking()<CR>a")
map({ "i" }, "<C-A-ScrollWheelUp>", "<esc>:lua IncreaseTracking()<CR>a")
map({ "i" }, "<C-A-ScrollWheelDown>", "<esc>:lua DecreaseTracking()<CR>a")

map({ "n", "v", "c" }, "<C-0>", ":lua SetFont(" .. base_font_size .. "," .. base_tracking .. ")<CR>")
map({ "i" }, "<C-0>", "<esc>:lua SetFont(" .. base_font_size .. "," .. base_tracking .. ")<CR>a")

SetFont(base_font_size, base_tracking)

map("n", "<leader>e", function()
  vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen
end, { desc = "Toggle Neovide Fullscreen" })

-- no scroll when switching buffers
local scroll_length = 0.125
vim.g.neovide_scroll_animation_length = scroll_length

vim.api.nvim_create_autocmd("BufLeave", {
  callback = function()
    vim.g.neovide_scroll_animation_length = 0
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.fn.timer_start(70, function()
      vim.g.neovide_scroll_animation_length = scroll_length
    end)
  end,
})
