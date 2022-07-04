local present, onedark = pcall(require, "onedark")

if not present then
  return
end

onedark.setup {
  style = "dark",
  toggle_style_key = '<leader>tt',
  toggle_style_list = {"dark", "light"}
}

onedark.load()
