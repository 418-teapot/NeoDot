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
    }
  },
  indent = { char = "│" },
}

return options
