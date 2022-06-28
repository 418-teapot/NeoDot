local M = {}

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- set indent for different file type
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

-- auto jump to the last viewed position
M.jump = function()
  local group = augroup("jump", {})
  autocmd("BufReadPost", {
    pattern = "*",
    group = group,
    callback = function()
      local lastview = vim.api.nvim_buf_get_mark(0, '"')
      local lastline, _ = unpack(lastview)
      if lastline ~= 0 then
        vim.api.nvim_win_set_cursor(0, lastview)
      end
    end
  })
end

return M
