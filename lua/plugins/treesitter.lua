-- All plugins have lazy = true by default

local plugins = {
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufEnter",
    cmd = {
      "TSInstall",
      "TSBufEnable",
      "TSBufDisable",
      "TSModuleInfo",
    },
    build = ":TSUpdate",
    init = function()
      require("plugins.configs.treesitter")
    end,
    configs = function()
      vim.wo.foldmethod = "expr"
      vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
    end,
    dependencies = {
      {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = function()
          return require("plugins.configs.blankline")
        end,
      },
      {
        "nvim-treesitter/nvim-treesitter-context",
        opts = function()
          require("treesitter-context").setup({
            max_lines = 3,
            trim_scope = "inner",
          })
        end,
      },
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
      },
    },
  },
}

return plugins
