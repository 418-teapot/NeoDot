vim.cmd("packadd packer.nvim")

local plugins = {
  ["wbthomason/packer.nvim"] = {},
  ["rainbowhxch/accelerated-jk.nvim"] = {},

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
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    config = function()
      require("plugins.configs.nvimtree")
    end
  },

  ["NvChad/nvim-colorizer.lua"] = {
    opt = true,
    setup = function()
      require("core.events").colorizer()
    end,
    config = function()
      require("plugins.configs.colorizer")
    end
  },

  -- only load whichkey after all the gui
  ["folke/which-key.nvim"] = {
    module = "which-key",
    config = function()
      require("plugins.configs.whichkey")
    end
  }
}

require("core.packer").run(plugins)
