-- All plugins have lazy = true by default.

local keys = {
  {
    "<A-t>",
    "<cmd>exe v:count1 . 'ToggleTerm'<cr>",
    mode = "n",
    desc = "toggle terminal",
  },
  {
    "<A-a>",
    "<cmd>ToggleTermToggleAll<cr>",
    mode = "n",
    desc = "toggle all terminal",
  },
  -- { "<A-s>", "<cmd>ToggleTermSendVisualSelection<cr>", mode = "n", desc = "send select text to terminal" },
}

local options = {
  size = function(term)
    if term.direction == "horizontal" then
      return 10
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  shade_terminals = false,
  shell = "bash",
}

local plugin = {
  {
    "akinsho/toggleterm.nvim",
    keys = keys,
    opts = function()
      return options
    end,
  },
}

return plugin
