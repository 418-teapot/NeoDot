-- All plugins have lazy = true by default.

local plugin = {
  {
    "folke/trouble.nvim",
    cmd = {
      "TroubleToggle",
      "Trouble",
    },
    opts = {
      use_diagnostic_signs = true,
    },
  },
}

return plugin
