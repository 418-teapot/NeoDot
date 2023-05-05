-- All plugins have lazy = true by default
local plugins = {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      {
        "L3MON4D3/LuaSnip",
        dependencies = {
          "rafamadriz/friendly-snippets",
        },
      },
      {
        "tzachar/cmp-tabnine",
        build = "./install.sh"
      },
    }, -- dependencies
    opts = function()
      return require("plugins.configs.cmp")
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    dependencies = {
      "nvim-cmp",
    },
    config = function()
      require("plugins.configs.autopairs")
    end,
  },
}

return plugins
