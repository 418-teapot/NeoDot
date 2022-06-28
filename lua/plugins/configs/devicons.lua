local present, devicons = pcall(require, "nvim-web-devicons")

if not present then
  return
end

devicons.set_icon {
  markdown = {
    icon = "",
    color = "#519aba",
    cterm_color = "67",
    name = "Markdown"
  },
  md = {
    icon = "",
    color = "#519aba",
    cterm_color = "67",
    name = "Markdown"
  }
}
