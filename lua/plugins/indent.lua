-- All plugins have lazy = true by default.

local options = {
  exclude = {
    filetypes = {
      -- Default
      "lspinfo",
      "packer",
      "checkhealth",
      "help",
      "man",
      "gitcommit",
      "TelescopePrompt",
      "TelescopeResults",
      "",

      "lazy",
      "mason",
      "terminal",
      "vimdoc",
    },
  },
  indent = { char = "│" },
}

local plugin = {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = function()
      return options
    end,
  },
}

return plugin
