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
    event = "BufEnter",
    opts = {},
  },

  {
    "akinsho/bufferline.nvim",
    event = "BufEnter",
    keys = {
      { "<Tab>", "<cmd>BufferLineCycleNext<cr>", mode = "n", desc = "goto next buffer" },
      { "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", mode = "n", desc = "goto prev buffer" },
      { "<leader>1", "<cmd>BufferLineGoToBuffer 1<cr>", mode = "n", desc = "goto buffer 1" },
      { "<leader>2", "<cmd>BufferLineGoToBuffer 2<cr>", mode = "n", desc = "goto buffer 2" },
      { "<leader>3", "<cmd>BufferLineGoToBuffer 3<cr>", mode = "n", desc = "goto buffer 3" },
      { "<leader>4", "<cmd>BufferLineGoToBuffer 4<cr>", mode = "n", desc = "goto buffer 4" },
      { "<leader>5", "<cmd>BufferLineGoToBuffer 5<cr>", mode = "n", desc = "goto buffer 5" },
      { "<leader>6", "<cmd>BufferLineGoToBuffer 6<cr>", mode = "n", desc = "goto buffer 6" },
      { "<leader>7", "<cmd>BufferLineGoToBuffer 7<cr>", mode = "n", desc = "goto buffer 7" },
      { "<leader>8", "<cmd>BufferLineGoToBuffer 8<cr>", mode = "n", desc = "goto buffer 8" },
      { "<leader>9", "<cmd>BufferLineGoToBuffer 9<cr>", mode = "n", desc = "goto buffer 9" },
    },
    opts = function()
      return require("plugins.configs.bufferline")
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufEnter",
    cmd = {
      "TSInstall",
      "TSBufEnable",
      "TSBufDisable",
      "TSModuleInfo",
    },
    build = ":TSUpdate",
    init = function()
      require("plugins.configs.treesitter")
    end,
    configs = function()
      vim.wo.foldmethod = "expr"
      vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
    end,
    dependencies = {
      {
        "lukas-reineke/indent-blankline.nvim",
        opts = function()
          return require("plugins.configs.blankline")
        end,
      },
      {
        "nvim-treesitter/nvim-treesitter-context",
        "nvim-treesitter/nvim-treesitter-textobjects",
      },
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    keys = {
      { "<C-n>", "<cmd>NvimTreeToggle<cr>", mode = "n", desc = "toggle NvimTree" },
    },
    opts = {},
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

  {
    "numToStr/Comment.nvim",
    keys = {
      "<leader>c",
      "<leader>b",
      "<leader>cc",
      "<leader>bc",
    },
    opts = function()
      return require("plugins.configs.comment")
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    event = "BufEnter",
    keys = {
      { "]h", function() require("gitsigns").next_hunk() end, mode = "n", desc = "next hunk" },
      { "[h", function() require("gitsigns").prev_hunk() end, mode = "n", desc = "prev hunk" },
    },
    opts = {},
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>wk", "<cmd>WhichKey<cr>", mode = "n", desc = "which-key all keymaps" },
    },
    opts = {},
  },

}

local lazy_config = require("plugins.configs.lazy_nvim")

require("lazy").setup(plugins, lazy_config)
