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
      {
        "<Tab>",
        "<cmd>BufferLineCycleNext<cr>",
        mode = "n",
        desc = "goto next buffer",
      },
      {
        "<S-Tab>",
        "<cmd>BufferLineCyclePrev<cr>",
        mode = "n",
        desc = "goto prev buffer",
      },
      {
        "<leader>1",
        "<cmd>BufferLineGoToBuffer 1<cr>",
        mode = "n",
        desc = "goto buffer 1",
      },
      {
        "<leader>2",
        "<cmd>BufferLineGoToBuffer 2<cr>",
        mode = "n",
        desc = "goto buffer 2",
      },
      {
        "<leader>3",
        "<cmd>BufferLineGoToBuffer 3<cr>",
        mode = "n",
        desc = "goto buffer 3",
      },
      {
        "<leader>4",
        "<cmd>BufferLineGoToBuffer 4<cr>",
        mode = "n",
        desc = "goto buffer 4",
      },
      {
        "<leader>5",
        "<cmd>BufferLineGoToBuffer 5<cr>",
        mode = "n",
        desc = "goto buffer 5",
      },
      {
        "<leader>6",
        "<cmd>BufferLineGoToBuffer 6<cr>",
        mode = "n",
        desc = "goto buffer 6",
      },
      {
        "<leader>7",
        "<cmd>BufferLineGoToBuffer 7<cr>",
        mode = "n",
        desc = "goto buffer 7",
      },
      {
        "<leader>8",
        "<cmd>BufferLineGoToBuffer 8<cr>",
        mode = "n",
        desc = "goto buffer 8",
      },
      {
        "<leader>9",
        "<cmd>BufferLineGoToBuffer 9<cr>",
        mode = "n",
        desc = "goto buffer 9",
      },
    },
    opts = function()
      return require("plugins.configs.bufferline")
    end,
  },
}

return plugins
