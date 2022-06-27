local M = {}

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

M.indent = function()
  local group = augroup("indent", {})
  autocmd("FileType", {
    pattern = "make",
    group = group,
    callback = function()
      vim.bo.expandtab = false
    end
  })
  autocmd("FileType", {
    pattern = {"c", "cpp", "cc", "js", "ts", "lua"},
    group = group,
    callback = function()
      vim.bo.shiftwidth = 2
      vim.bo.tabstop = 2
      vim.bo.softtabstop = 2
    end
  })
end

-- don't auto commenting new lines
M.comment = function()
  local group = augroup("comments", {})
  autocmd("BufEnter", {
    pattern = "*",
    group = group,
    callback = function()
      vim.bo.formatoptions = "jql"
    end
  })
end

return M
