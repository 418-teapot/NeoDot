vim.cmd("packadd packer.nvim")

local plugins = {
  ["wbthomason/packer.nvim"] = {},
  ["navarasu/onedark.nvim"] = {
    config = function()
      require("plugins.configs.theme")
    end
  },
  ["kyazdani42/nvim-web-devicons"] = {
    module = "nvim-web-devicons",
    config = function()
      require("plugins.configs.devicons")
    end
  },
  ["akinsho/bufferline.nvim"] = {
    requires = {"kyazdani42/nvim-web-devicons"},
    config = function()
      require("plugins.configs.bufferline")
    end
  },
  ["nvim-lualine/lualine.nvim"] = {
    requires = {"kyazdani42/nvim-web-devicons"},
    config = function()
      require("plugins.configs.lualine")
    end
  },
  ["kyazdani42/nvim-tree.lua"] = {
    requires = {"kyazdani42/nvim-web-devicons"},
    config = function()
      require("plugins.configs.nvimtree")
    end
  },
  ["rainbowhxch/accelerated-jk.nvim"] = {},

  -- only load whichkey after all the gui
  ["folke/which-key.nvim"] = {
    module = "which-key",
    config = function()
      require("plugins.configs.whichkey")
    end
  }
}

require("core.packer").run(plugins)
