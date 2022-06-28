vim.cmd("packadd packer.nvim")

local plugins = {
  ["wbthomason/packer.nvim"] = {},
  ["navarasu/onedark.nvim"] = {
    config = function()
      require("plugins.configs.onedark")
    end
  },
  ["kyazdani42/nvim-web-devicons"] = {
    module = "nvim-web-devicons",
    config = function()
      require("plugins.configs.devicons")
    end
  },
  ["kyazdani42/nvim-tree.lua"] = {
    requires = {"kyazdani42/nvim-web-devicons"},
    config = function()
      require("plugins.configs.nvimtree")
    end
  }
}

require("core.packer").run(plugins)
