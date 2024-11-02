-- All plugins have lazy = true by default.

local plugin = {
  {
    "nvim-tree/nvim-tree.lua",
    keys = {
      {
        "<C-n>",
        "<cmd>NvimTreeToggle<cr>",
        mode = "n",
        desc = "toggle NvimTree",
      },
    },
    opts = {},
  },
}

return plugin
