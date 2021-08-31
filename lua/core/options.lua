local global = require('core.global')

local disable_builtin_plugins = function()
  local plugins_list = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logiPat",
    "rrhelper",
    "spellfile_pulgin",
    "matchit",
    "matchparen"
  }

  for _, plugin in pairs(plugins_list) do
    vim.g["loaded_" .. plugin] = 1
  end
end

local set_basic_option = function()
  local view_option = {
    termguicolors = true;
    number = true;
    relativenumber = true;
    showbreak = "↳  ";
    showtabline = 2;
    cursorline = true;
    ruler = false;
    colorcolumn = "81";
    hidden = true;
  }

  local use_option = {
    mouse = "nv";
    magic = true;
    clipboard = "unnamedplus";
    wildignore = "*.DS_Store";
    wildignorecase = true;
    ignorecase = true;
    smartcase = true;
    infercase = true;
    incsearch = true;
    wrapscan = true;
    timeout = true;
    ttimeout = true;
    timeoutlen = 500;
    ttimeoutlen = 10;
    updatetime = 10;
  }

  local coding_option = {
    tabstop = 2;
    softtabstop = 2;
    softtabstop = -1;
    expandtab = true;
    smarttab = true;
    shiftwidth = 2;
    shiftround = true;
    textwidth = 80;
    autoindent = true;
    smartindent = true;
    foldlevelstart = 99;
  }

  local other_option = {
    directory = global.cache_dir .. "swap" .. global.path_sep;
    undodir = global.cache_dir .. "undo" .. global.path_sep;
    backupdir = global.cache_dir .. "backup" .. global.path_sep;
    viewdir = global.cache_dir .. "view" .. global.path_sep;
    virtualedit = "block";
    encoding = "utf-8";
    fileformats = "unix,mac,dos";
    backup = false;
    backupskip = "/tmp/*,$TMP/*,*/build/*";
    undofile = true;
    history = 2000;
    shada = "!,'300,<50,@100,s10,h";
  }

  local option_set = {
    view_option,
    use_option,
    coding_option,
    other_option
  }

  for _, set in pairs(option_set) do
    for name, value in pairs(set) do
      vim.o[name] = value
    end
  end
end

local set_mac_clipboard = function()
  if global.is_mac then
    vim.g.clipboard = {
      name = "macOS-clipboard",
      copy = {
        ["+"] = "pbcopy",
        ["*"] = "pbcopy",
      },
      paste = {
        ["+"] = "pbpaste",
        ["*"] = "pbpaste",
      },
      cache_enabled = 0
    }
    vim.g.python_host_prog = '/usr/bin/python'
    vim.g.python3_host_prog = '/usr/loca/bin/python3'
  end
end

local load_options = function()
  disable_builtin_plugins()
  set_basic_option()
  set_mac_clipboard()
end

load_options()
