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

  {
    "neovim/nvim-lspconfig",
    event = {
      "BufReadPre",
      "BufNewFile",
    },
    keys = {
      { "]d", vim.diagnostic.goto_next, mode = "n", desc = "Next diagnostic" },
      { "[d", vim.diagnostic.goto_prev, mode = "n", desc = "Prev diagnostic" },
      { "<leader>e", vim.diagnostic.open_float, mode = "n", desc = "Diagnostic float window" },
      { "<leader>q", vim.diagnostic.setloclist, mode = "n", desc = "Diagnostic float window" },
    },
    dependencies = {
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("plugins.configs.lspconfig")
    end,
  },
}

return plugins
