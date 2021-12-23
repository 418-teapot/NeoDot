local set_mapping = require("mapping.bind").set_mapping
local maps = require("mapping.config")

vim.g.mapleader = " "

for _, map in pairs(maps) do
  set_mapping(map)
end
