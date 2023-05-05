local options = {
  filetype_exclude = {
    "help",
    "terminal",
    "lazy",
    "lspinfo",
    "TelescopePrompt",
    "TelescopeResults",
    "mason",
    ""
  },
  buftype_exclude = { "terminal" },
  show_current_context = true,
  -- If you are using kitty and tmux, take a look at this article to make it work
  -- http://evantravers.com/articles/2021/02/05/curly-underlines-in-kitty-tmux-neovim/
  show_current_context_start = true,
}

return options
