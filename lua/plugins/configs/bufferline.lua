local present, bufferline = pcall(require, "bufferline")

if not present then
  return
end

local options = {
  options = {
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "left"
      }
    }
  }
}

bufferline.setup(options)
