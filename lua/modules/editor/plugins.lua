local editor = {}
local conf = require('modules.editor.config')

editor['rhysd/accelerated-jk'] = {
  opt = true,
}

editor['norcalli/nvim-colorizer.lua'] = {
  ft = {'html', 'css', 'vim', 'typescript', 'javascript'},
  config = conf.nvim_colorizer,
}

return editor
