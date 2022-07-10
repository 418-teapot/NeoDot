local present, colorizer = pcall(require, "colorizer")

if not present then
  return
end

local filetypes = { "*" }

local options = {
  names = false,
  rgb_fn = true,
}

colorizer.setup(filetypes, options)

vim.cmd("ColorizerAttachToBuffer")
