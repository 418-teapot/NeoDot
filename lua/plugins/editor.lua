-- All plugins have lazy = true by default

local plugins = {
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
      { "<leader>c", mode = { "n", "v" } },
      { "<leader>b", mode = { "n", "v" } },
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

  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    keys = {
      -- find
      { "<leader>ff", "<cmd>Telescope find_files<cr>", mode = "n", desc = "Find files" },
      { "<leader>fa", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<cr>", mode = "n", desc = "Find all files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", mode = "n", desc = "Find grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", mode = "n", desc = "Find buffers" },
      { "<leader>fo", "<cmd>Telescope oldfiles<cr>", mode = "n", desc = "Find oldfiles" },

      -- git
      { "<leader>gc", "<cmd>Telescope git_commits<cr>", mode = "n", desc = "Git commits" },
      { "<leader>gs", "<cmd>Telescope git_status<cr>", mode = "n", desc = "Git status" },
      { "<leader>gb", "<cmd>Telescope git_branches<cr>", mode = "n", desc = "Git branches" },
    },
    opts = function()
      return require("plugins.configs.telescope")
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
}

return plugins
