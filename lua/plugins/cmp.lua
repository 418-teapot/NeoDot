-- All plugins have lazy = true by default.

local opts = function()
  local options = {
    cmdline = {
      enabled = true,
    },
    fuzzy = { implementation = "prefer_rust" },
    sources = {
      default = {
        "lsp",
        "snippets",
        "buffer",
        "path",
        "avante_commands",
        "avante_files",
        "avante_mentions",
        "avante_shortcuts",
      },
      providers = {
        avante_commands = {
          name = "avante_commands",
          module = "blink.compat.source",
          score_offset = 90,
          opts = {},
        },
        avante_files = {
          name = "avante_files",
          module = "blink.compat.source",
          score_offset = 90,
          opts = {},
        },
        avante_mentions = {
          name = "avante_mentions",
          module = "blink.compat.source",
          score_offset = 90,
          opts = {},
        },
        avante_shortcuts = {
          name = "avante_shortcuts",
          module = "blink.compat.source",
          score_offset = 90,
          opts = {},
        },
      },
    },
    keymap = {
      preset = "none",
      ["<CR>"] = { "accept", "fallback" },
      ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
      ["<C-u>"] = { "scroll_documentation_up", "fallback" },
      ["<C-d>"] = { "scroll_documentation_down", "fallback" },
    },
    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
        window = { border = "single" },
      },
      list = {
        selection = {
          preselect = false,
        },
      },
      menu = require("nvchad.blink").menu,
    },
  }
  return options
end

local plugin = {
  {
    "saghen/blink.cmp",
    version = "1.*",
    event = { "InsertEnter", "CmdLineEnter" },
    dependencies = {
      "rafamadriz/friendly-snippets",
      "nvchad/ui",
      {
        "saghen/blink.compat",
        version = "2.*",
        opts = {},
      },
    },
    opts = opts,
    opts_extend = { "sources.default" },
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      disable_filetype = { "TelescopePrompt", "vim" },
      map_cr = true,
    },
  },
}

return plugin
