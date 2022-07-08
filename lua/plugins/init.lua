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

  ["akinsho/toggleterm.nvim"] = {
    config = function()
      require("plugins.configs.toggleterm")
    end
  },

  ["nvim-treesitter/nvim-treesitter"] = {
    module = "nvim-treesitter",
    setup = function()
      require("core.events").on_file_open("nvim-treesitter")
    end,
    cmd = {
      "TSInstall",
      "TSBufEnable",
      "TSBufDisable",
      "TSEnable",
      "TSDisable",
      "TSModuleInfo"
    },
    run = ":TSUpdate",
    config = function()
      require("plugins.configs.treesitter")
    end
  },

  ["nvim-treesitter/nvim-treesitter-context"] = {
    requires = {"nvim-treesitter/nvim-treesitter"},
    after = "nvim-treesitter",
  },

  ["nvim-treesitter/nvim-treesitter-textobjects"] = {
    requires = {"nvim-treesitter/nvim-treesitter"},
    after = "nvim-treesitter"
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
