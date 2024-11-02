-- All plugins have lazy = true by default.

local keys = {
  {
    "]t",
    function()
      require("todo-comments").jump_next()
    end,
    desc = "Next todo comment",
  },
  {
    "[t",
    function()
      require("todo-comments").jump_prev()
    end,
    desc = "Prev todo comment",
  },
}

local plugin = {
  {
    "folke/todo-comments.nvim",
    cmd = {
      "TodoTrouble",
      "TodoTelescope",
    },
    event = {
      "BufReadPost",
      "BufNewFile",
    },
    keys = keys,
    opts = {},
  },
}

return plugin
