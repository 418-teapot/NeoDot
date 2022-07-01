local present, bufferline = pcall(require, "bufferline")

if not present then
  return
end

local options = {
  options = {
  }
}

bufferline.setup(options)
