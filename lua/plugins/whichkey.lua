-- All plugins have lazy = true by default.

local keys = {
  {
    "<leader>wk",
    "<cmd>WhichKey<cr>",
    mode = "n",
    desc = "which-key all keymaps",
  },
}

local plugin = {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    keys = keys,
    opts = {},
  },
}

return plugin
