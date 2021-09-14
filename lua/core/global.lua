local get_global = function()
  local home = os.getenv("HOME")
  local os_name = vim.loop.os_uname().sysname
  local sep = (os_name == 'Windows') and '\\' or '/'
  local vim_path = vim.fn.stdpath('config')
  local data_dir = string.format('%s/site/', vim.fn.stdpath('data'))
  local global = {
    powerline_glyph = false,
    home = home,
    os_name = os_name,
    is_mac = os_name == 'Darwin',
    is_linux = os_name == 'Linux',
    is_windows = os_name == 'Windows',
    sep = sep,
    vim_path = vim_path,
    cache_dir = home .. sep .. '.cache' .. sep .. 'nvim' .. sep,
    data_dir = data_dir,
    modules_dir = vim_path .. sep .. 'lua' .. sep .. 'modules',
    packer_compiled = data_dir .. 'packer_compiled.vim',
    compile_to_lua = data_dir .. 'lua' .. sep .. '_compiled.lua',
  }
  return global
end

return get_global()
