local present, blankline = pcall(require, "indent_blankline")

if not present then
  return
end

local options = {
  char = "▏",
  filetype_exclude = {
    "help",
    "terminal",
    "packer",
    "lspinfo",
    "TelescopePrompt",
    "TelescopeResults",
    "lsp-installer",
    ""
  },
  buftype_exclude = { "terminal" },
  show_current_context = true,
  -- If you are using kitty and tmux, take a look at this article to make it work
  -- http://evantravers.com/articles/2021/02/05/curly-underlines-in-kitty-tmux-neovim/
  show_current_context_start = true
}

local context_bg = require("onedark.colors")["bg2"]
vim.cmd("highlight IndentBlanklineContextStart guibg=" .. context_bg .. " gui=nocombine")

blankline.setup(options)
