local M = {}

local map_cmd = require("mapping.bind").map_cmd

M.basic_map = {
  ["n| "] = map_cmd("")(with_noremap)();
  ["x| "] = map_cmd("")(with_noremap)();
  ["n|j"] = map_cmd("v:count || mode(1)[0:1] == 'no' ? 'j' : 'gj'")(with_expr)();
  ["n|k"] = map_cmd("v:count || mode(1)[0:1] == 'no' ? 'k' : 'gk'")(with_expr)();
}

return M
