-- All plugins have lazy = true by default

local plugins = {
  -- the colorscheme should be available when starting Neovim
  {
    "folke/tokyonight.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight]])
    end,
  },

  {
    "nvim-lua/plenary.nvim",
  },

  {
    "nvim-tree/nvim-web-devicons",
    opts = function()
      return require("plugins.configs.devicons")
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = {},
    event = {
      "BufEnter",
    },
  },

  {
    "akinsho/bufferline.nvim",
    event = {
      "BufEnter",
    },
    opts = function()
      return require("plugins.configs.bufferline")
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {},
    keys = {
      { "<C-n>", "<cmd>NvimTreeToggle<cr>", mode = "n", desc = "toggle NvimTree" },
    },
  },

  {
    "akinsho/toggleterm.nvim",
    keys = {
      { "<A-t>", "<cmd>exe v:count1 . 'ToggleTerm'<cr>", mode = "n", desc = "toggle terminal" },
      { "<A-a>", "<cmd>ToggleTermToggleAll<cr>", mode = "n", desc = "toggle all terminal" },
      { "<A-s>", "<cmd>ToggleTermSendVisualSelection<cr>", mode = "n", desc = "send select text to terminal" },
    },
    opts = function()
      return require("plugins.configs.toggleterm")
    end,
  },

}

local lazy_config = require("plugins.configs.lazy_nvim")

require("lazy").setup(plugins, lazy_config)
