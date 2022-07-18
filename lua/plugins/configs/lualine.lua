local present, lualine = pcall(require, "lualine")

if not present then
  return
end

local extensions = {
  "nvim-tree",
  "toggleterm"
}

lualine.setup({
  extensions = extensions
})
