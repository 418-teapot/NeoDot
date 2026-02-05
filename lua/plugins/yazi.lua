-- All plugins have lazy = true by default.

local plugins = {
  {
    "mikavilpas/yazi.nvim",
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      {
        "<C-y>",
        "<cmd>Yazi cwd<cr>",
        desc = "Open yazi",
      }
    },
    opts = {
      open_for_directories = false,
    }
  }
}

return plugins
