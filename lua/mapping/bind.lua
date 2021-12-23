local M = {}

local map = function()
  local instance = {
    cmd = "";
    options = {
      noremap = false;
      silent = false;
      expr = false;
      nowait = false;
    };
  }
  
  with_noremap = function()
    instance.options.noremap = true
  end
  with_silent = function()
    instance.options.silent = true
  end
  with_expr = function()
    instance.options.expr = true
  end
  with_nowait = function()
    instance.options.nowait = true
  end
  map_cmd = function(cmd)
    instance.cmd = cmd
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

M.map_cmd = function(cmd)
  return map()(map_cmd, cmd)
end

M.set_mapping = function(mapping)
  for key, value in pairs(mapping) do
    local mode, keymap = key:match("([^|]*)|?(.*)")
    assert(type(value) == 'table')
    vim.api.nvim_set_keymap(mode, keymap, value.cmd, value.options)
  end
end

return M
