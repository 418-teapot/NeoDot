-- All plugins have lazy = true by default.

local plugins = {
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    opts = {
      preview = {
        icon_provider = "devicons",
      },
    },
  },
}

return plugins
