local M = {}

M.indent = function()
  local group = vim.api.nvim_create_augroup("indent", {})
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "make",
    group = group,
    callback = function()
      vim.bo.expandtab = false
    end
  })
  vim.api.nvim_create_autocmd("FileType", {
    pattern = {"c", "cpp", "cc", "js", "ts", "lua"},
    group = group,
    callback = function()
      vim.bo.shiftwidth = 2
      vim.bo.tabstop = 2
      vim.bo.softtabstop = 2
    end
  })
end

return M
