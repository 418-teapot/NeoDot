-- All plugins have lazy = true by default.

local keys = {
  {
    "<Tab>",
    "<cmd>BufferLineCycleNext<cr>",
    mode = "n",
    desc = "goto next buffer",
  },
  {
    "<S-Tab>",
    "<cmd>BufferLineCyclePrev<cr>",
    mode = "n",
    desc = "goto prev buffer",
  },
  {
    "<leader>1",
    "<cmd>BufferLineGoToBuffer 1<cr>",
    mode = "n",
    desc = "goto buffer 1",
  },
  {
    "<leader>2",
    "<cmd>BufferLineGoToBuffer 2<cr>",
    mode = "n",
    desc = "goto buffer 2",
  },
  {
    "<leader>3",
    "<cmd>BufferLineGoToBuffer 3<cr>",
    mode = "n",
    desc = "goto buffer 3",
  },
  {
    "<leader>4",
    "<cmd>BufferLineGoToBuffer 4<cr>",
    mode = "n",
    desc = "goto buffer 4",
  },
  {
    "<leader>5",
    "<cmd>BufferLineGoToBuffer 5<cr>",
    mode = "n",
    desc = "goto buffer 5",
  },
  {
    "<leader>6",
    "<cmd>BufferLineGoToBuffer 6<cr>",
    mode = "n",
    desc = "goto buffer 6",
  },
  {
    "<leader>7",
    "<cmd>BufferLineGoToBuffer 7<cr>",
    mode = "n",
    desc = "goto buffer 7",
  },
  {
    "<leader>8",
    "<cmd>BufferLineGoToBuffer 8<cr>",
    mode = "n",
    desc = "goto buffer 8",
  },
  {
    "<leader>9",
    "<cmd>BufferLineGoToBuffer 9<cr>",
    mode = "n",
    desc = "goto buffer 9",
  },
}

local options = {
  options = {
    numbers = function(opts)
      local state = require("bufferline.state")
      for i, buf in ipairs(state.visible_components) do
        if buf.id == opts.id then
          return i
        end
      end
      return opts.ordinal
    end, -- numbers
  },
}

local plugin = {
  {
    "akinsho/bufferline.nvim",
    event = "BufEnter",
    keys = keys,
    opts = function()
      return options
    end,
  },
}

return plugin
