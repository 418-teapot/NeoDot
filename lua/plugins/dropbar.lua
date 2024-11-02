-- All plugins have lazy = true by default.

local plugin = {
  {
    "Bekaboo/dropbar.nvim",
    event = {
      "BufReadPost",
      "BufNewFile",
    },
  },
}

return plugin
