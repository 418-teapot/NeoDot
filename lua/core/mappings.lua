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

    -- Copy all
    ["<C-c>"] = { "<cmd> %y+ <CR>", " copy whole file" },

    -- line numbers
    ["<leader>n"] = { "<cmd> set nu! <CR>", " toggle line number" },
    ["<leader>rn"] = { "<cmd> set rnu! <CR>", " toggle relative number" },

    ["<leader>tt"] = {
      function()
        require("core.utils").toggle_theme()
      end,
      " toggle theme",
    }
  },
  t = {
    ["<C-x"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), " escape terminal mode" },
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

M.whichkey = {
  n = {
    ["<leader>wk"] = { "<cmd> WhichKey <CR>", "﬜ which-key all keymaps" }
  }
}

return M
