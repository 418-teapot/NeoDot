local bind = require('keymap.bind')
local map_cmd = bind.map_cmd
local config = require('keymap.config')

vim.g.mapleader = " "
vim.api.nvim_set_keymap('n', ' ', '', {noremap = true})
vim.api.nvim_set_keymap('x', ' ', '', {noremap = true})

local plug_map = {
  ["n|j"] = map_cmd(config.enhance_jk_move('j'))(with_silent)(with_expr)(),
  ["n|k"] = map_cmd(config.enhance_jk_move('k'))(with_silent)(with_expr)(),
}

bind.nvim_load_mapping(plug_map)
