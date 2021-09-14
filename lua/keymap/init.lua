local bind = require('keymap.bind')
local map_cmd = bind.map_cmd
local config = require('keymap.config')

local leader_map = function()
  vim.g.mapleader = " "
  vim.api.nvim_set_keymap('n', ' ', '', {noremap = true})
  vim.api.nvim_set_keymap('x', ' ', '', {noremap = true})
end

local load_keymap = function()
  leader_map()
end

local plug_map = {
  ["n|j"] = map_cmd(config.enhance_jk_move('j')),
  ["n|k"] = map_cmd(config.enhance_jk_move('k')),
}

load_keymap()
bind.nvim_load_mapping(plug_map)
