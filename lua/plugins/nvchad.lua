-- All plugins have lazy = true by default.

local ui_keys = {
  {
    "<A-t>",
    function()
      require("nvchad.term").toggle({ pos = "sp", id = "xz" })
    end,
    mode = { "n", "t" },
    desc = "toggle terminal",
  },
}

local menu_keys = {
  {
    "<RightMouse>",
    function()
      require("menu.utils").delete_old_menus()

      vim.cmd.exec('"normal! \\<RightMouse>"')
      local options = "default"
      require("menu").open(options, { mouse = true })
    end,
    mode = { "n", "v" },
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

  "nvzone/volt",

  {
    "nvzone/menu",
    keys = menu_keys,
    dependencies = {
      "nvzone/volt",
    },
  },
}

return plugin
