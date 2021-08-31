local ui = {}
local conf = require('modules.ui.config')

ui['glepnir/zephyr-nvim'] = {
  config = [[vim.cmd('colorscheme zephyr')]]
}

ui['hoob3rt/lualine.nvim'] = {
  config = conf.lualine
}

ui['akinsho/nvim-bufferline.lua'] = {
  config = conf.bufferline
}

return ui
