local opt = vim.opt
local g = vim.g

---------------------------------- options -------------------------------------
-- set leader key
g.mapleader = " "

-- always start editing with no code folds
opt.foldlevelstart = 99

-- allow the cursor can be positioned where there is no actual character
-- in visual block mode
opt.virtualedit = "block"

-- ebable 24-bit RGB color in the TUI
opt.termguicolors = true

-- only the last window have a status line
opt.laststatus = 3

-- vim builtin status line doesn't show the line and column number of the cursor
-- position
opt.ruler = false

-- vim builtin status line doesn't show mode
opt.showmode = false

-- always not show builtin tab page line
opt.showtabline = 0

-- string to put at the start of lines that have been wrapped
opt.showbreak = "↳  "

-- use + register as system clipboard for cross-platform
opt.clipboard = "unnamedplus"

-- show the line number relative to line with the cursor
opt.number = true
opt.relativenumber = true

-- highlight the text line with the cursor
opt.cursorline = true

-- highlight 81 column
opt.colorcolumn = "81"

-- `sp` will put the new window below
opt.splitbelow = true
-- `vsp` will put the new window right
opt.splitright = true

-- set indent
opt.tabstop = 4
opt.softtabstop = 4
opt.expandtab = true
opt.shiftwidth = 4
opt.shiftround = true
opt.smartindent = true

-- use mouse for all modes
opt.mouse = "a"

-- go to previous/next line with h, l, left and right arrow when cursor
-- reaches end/beginning of line
opt.whichwrap:append "<>[]hl"

-- ignore case when the pattern contains lowercase letters only
opt.ignorecase = true
opt.smartcase = true

-- time in milliseconds to wait for a mapped sequence to complete
opt.timeoutlen = 400

-- interval for writing swap file to disk
opt.updatetime = 250

-- automatically save undo history to an undo file
-- defualt undodir is $XDG_HOME/nvim/undo/
-- if $XDG_HOME is not defined, it will be $HOME/.local/share
opt.undofile = true

-- disable some default providers
local disabled_providers = {
  "node",
  "perl",
  "python3",
  "ruby",
}

for _, provider in pairs(disabled_providers) do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end
--------------------------------- mapping --------------------------------------
require("core.mappings")

--------------------------------- autocmds -------------------------------------
local autocmds = require("core.events")

autocmds.indent()
autocmds.comment()
autocmds.jump()
