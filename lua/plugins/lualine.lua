-- All plugins have lazy = true by default.

local plugin = {
  {
    "nvim-lualine/lualine.nvim",
    event = "BufEnter",
    opts = {},
  },
}

return plugin
