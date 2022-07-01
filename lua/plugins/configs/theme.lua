local present, onedark = pcall(require, "onedark")

if not present then
  return
end

onedark.setup {
  style = "warmer",
  toggle_style_key = '<leader>tt',
  toggle_style_list = {"warmer", "light"}
}

onedark.load()
