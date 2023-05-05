-- n = normal mode
-- v = visual mode
-- i = insert mode
-- t = terminal mode

local map = function(mode, l, r, opts)
  if type(opts) == "string" then
    vim.keymap.set(mode, l, r, { desc = opts })
  else
    vim.keymap.set(mode, l, r, opts)
  end
end

-- Editing
map("i", "<C-a>", "<ESC>^i", "Start of line")
map("i", "<C-e>", "<End>", "End of line")
map("i", "<C-h>", "<Left>", "Move left")
map("i", "<C-l>", "<Right>", "Move right")
map("i", "<C-j>", "<Down>", "Move down")
map("i", "<C-k>", "<Up>", "Move up")

-- Searching
map("n", "<ESC>", "<cmd>noh<cr>", "No highlight")

-- Moving
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Identing
map("v", "<", "<gv", "Ident left")
map("v", ">", ">gv", "Ident right")

-- Windows
map("n", "<C-h>", "<C-w>h", "Window left")
map("n", "<C-l>", "<C-w>l", "Window right")
map("n", "<C-j>", "<C-w>j", "Window down")
map("n", "<C-k>", "<C-w>k", "Window up")
map("n", "<C-Up>", "<cmd>resize +2<cr>", "Window height increase")
map("n", "<C-Down>", "<cmd>resize -2<cr>", "Window height decrease")
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", "Window width increase")
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", "Window width decrease")

-- Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", "Move down")
map("n", "<A-k>", "<cmd>m .-2<cr>==", "Move up")
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", "Move down")
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", "Move up")
map("v", "<A-j>", ":m '>+1<cr>gv=gv", "Move down")
map("v", "<A-k>", ":m '<-2<cr>gv=gv", "Move up")

-- Termianl
map("t", "<ESC>", vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, true, true), "Escape terminal")
