local present, bufferline = pcall(require, "bufferline")

if not present then
  return
end

local options = {
  options = {
    show_close_icon = false,
    offsets = {
      {
        filetype = "NvimTree",
        text = "פּ File Explorer",
        highlight = "Directory",
        text_align = "left"
      }
    },
    custom_areas = {
      right = function()
        vim.cmd("function! ToggleTheme(a,b,c,d) \n lua require('core.utils').toggle_theme() \n endfunction")
        local result = {}
        local toggle_theme_icon = ""
        local style = vim.go.background
        if style == "dark" then
          toggle_theme_icon = "  "
        else
          toggle_theme_icon = "  "
        end
        table.insert(result, { text = "%@ToggleTheme@%#ToggleThemeButton#" .. toggle_theme_icon .. "%X" })
        return result
      end
    }
  }
}

bufferline.setup(options)
