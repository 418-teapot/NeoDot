local global = require('core.global')

local create_dir = function()
  local data_dir = {
    global.cache_dir,
    global.cache_dir .. 'backup',
    global.cache_dir .. 'session',
    global.cache_dir .. 'swap',
    global.cache_dir .. 'tags',
    global.cache_dir .. 'undo',
    global.cache_dir .. 'view'
  }

  for _, v in pairs(data_dir) do
    if vim.fn.isdirectory(v) == 0 then
      os.execute("mkdir -p " .. v)
    end
  end
end

local load_core = function()
  local packer = require('modules')
  create_dir()
  packer.ensure_plugins()
  require('core.options')
  require('keymap')
  packer.load_compile()
end

load_core()
