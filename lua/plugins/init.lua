local ok, packer = pcall(require, "plugins.packer")

if not ok then
  return false
end

local use = packer.use

return packer.startup(function()
  use {
    "wbthomason/packer.nvim",
    event = "VimEnter",
  }
  use {
    "EdenEast/nightfox.nvim",
     ---config = function()
     ---  require("nightfox").setup({
     ---    fox = "nordfox",
     ---  })
     ---end
  }
end)
