local rhs_options = {}

function rhs_options:new()
  local instance = {
    cmd = '',
    options = {
      noremap = false,
      silent = false,
      expr = false,
      nowait = false,
    }
  }
  setmetatable(instance, self)
  self.__index = self
  return instance
end

function rhs_options:map_cmd(cmd_string)
  self.cmd = cmd_string
  return self
end

local pbind = {}

function pbind.map_cmd(cmd_string)
  local ro = rhs_options:new()
  return ro:map_cmd(cmd_string)
end

function pbind.nvim_load_mapping(mapping)
  for key,value in pairs(mapping) do
    local mode,keymap = key:match("([^|]*)|?(.*)")
    if type(value) == 'table' then
      local rhs = value.cmd
      local options = value.options
      vim.api.nvim_set_keymap(mode,keymap,rhs,options)
    end
  end
end

return pbind
