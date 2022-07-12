-- n, v, i, t = mode names
-- n = normal mode
-- v = visual mode
-- i = insert mode
-- t = terminal mode

local M = {}

M.general = {
  i = {
    -- go to beginning and end
    ["<C-b>"] = { "<ESC>^i", "論 beginning of line" },
    ["<C-e>"] = { "<End>", "壟 end of line" },

    -- navigate within insert mode
    ["<C-h>"] = { "<Left>", " move left" },
    ["<C-l>"] = { "<Right>", " move right" },
    ["<C-j>"] = { "<Down>", " move down" },
    ["<C-k>"] = { "<Up>", " move up" },
  },
  n = {
    ["<ESC>"] = { "<cmd> noh <CR>", " no highlight" },

    -- switch between windows
    ["<C-h>"] = { "<C-w>h", " window left" },
    ["<C-l>"] = { "<C-w>l", " window right" },
    ["<C-j>"] = { "<C-w>j", " window down" },
    ["<C-k>"] = { "<C-w>k", " window up" },

    -- save
    ["<C-s>"] = { "<cmd> w <CR>", "﬚ save file" },

    -- line numbers
    ["<leader>n"] = { "<cmd> set nu! <CR>", " toggle line number" },
    ["<leader>rn"] = { "<cmd> set rnu! <CR>", " toggle relative number" },

    ["<leader>tt"] = {
      function()
        require("core.utils").toggle_theme()
      end,
      " toggle theme"
    },
  },
  t = {
    ["<ESC>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, true, true), " escape terminal mode"},
  },
}

M.bufferline = {
  n = {
    ["<Tab>"] = { "<cmd> BufferLineCycleNext <CR>" , " goto next buffer" },
    ["<S-Tab>"] = { "<cmd> BufferLineCyclePrev <CR>", " goto prev buffer" },
    ["<leader>1"] = { "<cmd> BufferLineGoToBuffer 1 <CR>", "open buffer 1" },
    ["<leader>2"] = { "<cmd> BufferLineGoToBuffer 2 <CR>", "open buffer 2" },
    ["<leader>3"] = { "<cmd> BufferLineGoToBuffer 3 <CR>", "open buffer 3" },
    ["<leader>4"] = { "<cmd> BufferLineGoToBuffer 4 <CR>", "open buffer 4" },
    ["<leader>5"] = { "<cmd> BufferLineGoToBuffer 5 <CR>", "open buffer 5" },
    ["<leader>6"] = { "<cmd> BufferLineGoToBuffer 6 <CR>", "open buffer 6" },
    ["<leader>7"] = { "<cmd> BufferLineGoToBuffer 7 <CR>", "open buffer 7" },
    ["<leader>8"] = { "<cmd> BufferLineGoToBuffer 8 <CR>", "open buffer 8" },
    ["<leader>9"] = { "<cmd> BufferLineGoToBuffer 9 <CR>", "open buffer 9" },
  }
}

M.nvimtree = {
  n = {
    ["<C-n>"] = { "<cmd> NvimTreeToggle <CR>", "פּ toggle nvimtree" },
    ["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "פּ focus nvimtree"}
  },
}

M.accelerated_jk = {
  n = {
    ["j"] = { "<Plug>(accelerated_jk_gj)", " move down" },
    ["k"] = { "<Plug>(accelerated_jk_gk)", " move up" }
  }
}

M.toggle_term = {
  n = {
    ["<A-t>"] = { "<cmd> exe v:count1 . 'ToggleTerm' <CR>", " toggle terminal"},
    ["<A-a>"] = { "<cmd> ToggleTermToggleAll <CR>", " toggle all terminal"},
    ["<A-s>"] = { "<cmd> ToggleTermSendVisualSelection <CR>", " send select text to terminal"},
  }
}

M.comment = {
  n = {
    ["<leader>/"] = {
      function()
        require("Comment.api").toggle_current_linewise()
      end,
      "蘒 toggle comment",
    },
    ["<leader>b/"] = {
      function()
        require("Comment.api").toggle_current_blockwise()
      end,
      "蘒 toggle comment with block",
    }
  },
  v = {
    ["<leader>/"] = {
      "<ESC><cmd> lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode()) <CR>",
      "蘒 toggle comment",
    },
    ["<leader>b/"] = {
      "<ESC><cmd> lua require('Comment.api').toggle_blockwise_op(vim.fn.visualmode()) <CR>",
      "蘒 toggle comment with block",
    }
  }
}

M.gitsigns = {
  n = {
    ["[h"] = {
      function()
        require("gitsigns").prev_hunk()
      end,
      "Previous hunk"
    },
    ["]h"] = {
      function()
        require("gitsigns").next_hunk()
      end,
      "Next hunk"
    }
  }
}

M.telescope = {
  n = {
    -- find
    ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", " find files" },
    ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", " find all files" },
    ["<leader>fg"] = { "<cmd> Telescope live_grep <CR>", " live grep" },
    ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", " find buffers" },
    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "ﲉ help page" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", " find oldfiles" },

    -- git
    ["<leader>gc"] = { "<cmd> Telescope git_commits <CR>", " git commits" },
    ["<leader>gs"] = { "<cmd> Telescope git_status <CR>", " git status" },
    ["<leader>gb"] = { "<cmd> Telescope git_branches <CR>", " git branches" },

    -- lsp
    ["<leader>d"] = { "<cmd> Telescope lsp_definitions <CR>", " lsp definition" },
    ["<leader>r"] = { "<cmd> Telescope lsp_references <CR>", " lsp references" },
    ["<leader>i"] = { "<cmd> Telescope lsp_implementations <CR>", " lsp implementations" },
    ["<leader>ld"] = { "<cmd> Telescope diagnostics <CR>", " lsp list diagnostics" },
    ["<leader>lt"] = { "<cmd> Telescope lsp_type_definitions <CR>", " lsp definition of type" },
  }
}

M.lspconfig = {
  n = {
    ["[d"] = {
      function()
        vim.diagnostic.goto_prev()
      end,
      "Previous diagnostic"
    },
    ["]d"] = {
      function()
        vim.diagnostic.goto_next()
      end,
      "Next diagnostic"
    },
    ["<leader>h"] = {
      function()
        vim.lsp.buf.hover()
      end,
      " lsp hover information"
    }
  }
}

M.whichkey = {
  n = {
    ["<leader>wk"] = { "<cmd> WhichKey <CR>", "﬜ which-key all keymaps" }
  }
}

return M
