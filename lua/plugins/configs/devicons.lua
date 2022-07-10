local present, devicons = pcall(require, "nvim-web-devicons")

if not present then
  return
end

devicons.set_icon({
  LICENSE = {
    icon = "",
    color = "#ff5722",
    cterm_color = "179",
    name = "License"
  },
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
  })
