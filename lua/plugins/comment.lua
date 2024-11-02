-- All plugins have lazy = true by default.

local keys = {
  { "<leader>c", mode = { "n", "v" } },
  { "<leader>b", mode = { "n", "v" } },
  "<leader>cc",
  "<leader>bc",
}

local options = {
  toggler = {
    line = "<leader>cc",
    block = "<leader>bc",
  },
  opleader = {
    line = "<leader>c",
    block = "<leader>b",
  },
  mappings = {
    extra = false,
  },
}

local plugin = {
  {
    "numToStr/Comment.nvim",
    keys = keys,
    opts = function()
      return options
    end,
  },
}

return plugin
