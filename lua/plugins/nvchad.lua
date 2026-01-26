-- All plugins have lazy = true by default.

local ui_keys = {
  {
    "<A-t>",
    function()
      require("nvchad.term").toggle { pos = "sp", id = "xz"}
    end,
    mode = {"n", "t"},
    desc = "toggle terminal",
  },
}

local menu_keys = {
  {
    "<RightMouse>",
    function()
      vim.cmd.exec('"normal! \\<RightMouse>"')
      local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
      require("menu").open(options, { mouse = true })
    end,
    mode = "n",
    desc = "Open menu",
  },
}

local plugin = {
  {
    "nvchad/ui",
    lazy = false,
    priority = 1000,
    config = function()
      require("nvchad")
    end,
    keys = ui_keys,
  },

  {
    "nvchad/base46",
    build = function()
      require("base46").load_all_highlights()
    end,
  },

  {
    "NvChad/menu",
    keys = menu_keys,
    dependencies = {
      "NvChad/volt",
    },
  },
}

return plugin
