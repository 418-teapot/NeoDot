-- All plugins have lazy = true by default

local plugins = {
  {
    "williamboman/mason.nvim",
    cmd = {
      "Mason",
      "MasonInstall",
      "MasonUninstall",
      "MasonUninstallAll",
      "MasonLog",
    },
    build = ":MasonUpdate",
    config = function()
      require("plugins.configs.mason")
    end,
  },
}

return plugins
