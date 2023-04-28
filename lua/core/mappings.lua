-- n = normal mode
-- v = visual mode
-- i = insert mode
-- t = terminal mode

local map = function(mode, l, r, desc)
  vim.keymap.set(mode, l, r, { desc = desc })
end

map("i", "<C-a>", "<ESC>^i", "Start of line")
map("i", "<C-e>", "<End>", "End of line")
map("i", "<C-h>", "<Left>", "Move left")
map("i", "<C-i>", "<Right>", "Move right")
map("i", "<C-j>", "<Down>", "Move down")
map("i", "<C-k>", "<Up>", "Move up")

map("n", "<ESC>", "<cmd>noh<cr>", "No highlight")
map("n", "<C-h>", "<C-w>h", "Window left")
map("n", "<C-i>", "<C-w>i", "Window right")
map("n", "<C-j>", "<C-w>j", "Window down")
map("n", "<C-k>", "<C-w>k", "Window up")

map("t", "<ESC>", vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, true, true), "Escape terminal")
