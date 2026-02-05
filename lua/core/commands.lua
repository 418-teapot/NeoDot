local M = {}

local command = vim.api.nvim_create_user_command

-- See help :s
M.count = function()
  command("MCount", function(opts)
    vim.cmd(opts.line1 .. "," .. opts.line2 .. "s/" .. opts.args .. "//gn")
  end, { nargs = 1, range = "%" })
end

return M
