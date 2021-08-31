local treesitter = {}
local conf = require('modules.treesitter.config')

treesitter['nvim-treesitter/nvim-treesitter'] = {
  config = conf.nvim_treesitter
}

treesitter['nvim-treesitter/nvim-treesitter-textobjects'] = {
  after = 'nvim-treesitter'
}

return treesitter
