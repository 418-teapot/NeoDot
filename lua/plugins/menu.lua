-- All plugins have lazy = true by default.

local keys = {
  {
    "<RightMouse>",
    function()
      vim.cmd.exec '"normal! \\<RightMouse>"'
      local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
      require("menu").open(options, { mouse = true })
    end,
    mode = "n",
    desc = "Open menu",
  },
}

local plugin = {
  {
    "NvChad/menu",
    keys = keys,
    dependencies = {
      "NvChad/volt",
    },
  },
}

return plugin
