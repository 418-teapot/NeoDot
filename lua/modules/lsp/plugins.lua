local lsp = {}
local conf = require('modules.lsp.config')

lsp['neovim/nvim-lspconfig'] = {
  config = conf.nvim_lsp
}

lsp['glepnir/lspsaga.nvim'] = {
  cmd = 'LspSaga'
}

return lsp
