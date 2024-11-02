-- All plugins have lazy = true by default.

local keys = {
  -- find
  {
    "<leader>ff",
    "<cmd>Telescope find_files<cr>",
    mode = "n",
    desc = "Find files",
  },
  {
    "<leader>fa",
    "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<cr>",
    mode = "n",
    desc = "Find all files",
  },
  {
    "<leader>fg",
    "<cmd>Telescope live_grep<cr>",
    mode = "n",
    desc = "Find grep",
  },
  {
    "<leader>fb",
    "<cmd>Telescope buffers<cr>",
    mode = "n",
    desc = "Find buffers",
  },
  {
    "<leader>fo",
    "<cmd>Telescope oldfiles<cr>",
    mode = "n",
    desc = "Find oldfiles",
  },

  -- git
  {
    "<leader>gc",
    "<cmd>Telescope git_commits<cr>",
    mode = "n",
    desc = "Git commits",
  },
  {
    "<leader>gs",
    "<cmd>Telescope git_status<cr>",
    mode = "n",
    desc = "Git status",
  },
  {
    "<leader>gb",
    "<cmd>Telescope git_branches<cr>",
    mode = "n",
    desc = "Git branches",
  },

  -- lsp
  {
    "<leader>d",
    "<cmd>Telescope lsp_definitions<cr>",
    mode = "n",
    desc = "Goto definition",
  },
  {
    "<leader>r",
    "<cmd>Telescope lsp_references<cr>",
    mode = "n",
    desc = "Goto reference",
  },
}

local options = {
  defaults = {
    prompt_prefix = " ",
    sorting_strategy = "ascending",
    file_ignore_patterns = {
      ".git/",
    },
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    path_display = {
      "truncate",
    },
    set_ebv = {
      ["COLORTERM"] = "truecolor",
    },
  },
}

local plugin = {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    keys = keys,
    opts = function()
      return options
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
}

return plugin
