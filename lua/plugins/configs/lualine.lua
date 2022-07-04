local present, lualine = pcall(require, "lualine")

if not present then
  return
end

local options = {
  theme = "onedark"
}

local extensions = {
  "nvim-tree"
}

lualine.setup(options, extensions)
