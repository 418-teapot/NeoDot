-- All plugins have lazy = true by default.

local keys = {
  {
    "]h",
    function()
      require("gitsigns").next_hunk()
    end,
    mode = "n",
    desc = "next hunk",
  },
  {
    "[h",
    function()
      require("gitsigns").prev_hunk()
    end,
    mode = "n",
    desc = "prev hunk",
  },
  {
    "<leader>gb",
    function()
      require("gitsigns").blame()
    end,
    mode = "n",
    desc = "Git blame",
  },
}

local plugin = {
  {
    "lewis6991/gitsigns.nvim",
    event = "BufEnter",
    keys = keys,
    opts = {},
  },
}

return plugin
