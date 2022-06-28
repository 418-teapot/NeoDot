local M = {}

M.toggle_theme = function()
  local style = vim.go.background
  if style == "dark" then
    style = "light"
  else
    style = "dark"
  end
  vim.go.background = style
  require("onedark").setup {
    style = style,
  }
  require("onedark").load()
end

return M
