local pbind = {}

local map = function()
  local instance = {
    cmd = '',
    options = {
      noremap = false,
      silent = false,
      expr = false,
      nowait = false,
    }
  }
  with_silent = function()
    instance.options.silent = true
  end
  with_noremap = function()
    instance.options.silent = true
  end
  with_nowait = function()
    instance.options.silent = true
  end
  with_expr = function()
    instance.options.silent = true
  end
  map_cmd = function(cmd_string)
    instance.cmd = cmd_string
  end
  local bind
  bind = function(func, ...)
    if func == nil then
      return instance
    end
    func(...)
    return bind
  end
  return bind
end

function pbind.map_cmd(cmd_string)
  return map()(map_cmd, cmd_string)
end

function pbind.nvim_load_mapping(mapping)
  for key, value in pairs(mapping) do
    local mode, keymap = key:match("([^|]*)|?(.*)")
    assert(type(value) == 'table')
    vim.api.nvim_set_keymap(mode, keymap, value.cmd, value.options)
  end
end

return pbind
