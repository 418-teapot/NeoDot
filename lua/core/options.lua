local misc = require("core.utils").misc

local options = {
  termguicolors = true;
  number = true;
  relativenumber = true;
  showbreak = "↳  ";
  showtabline = 2;
  cursorline = true;
  ruler = false;
  colorcolumn = "81";
  hidden = true;

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

  tabstop = 4;
  softtabstop = 4;
  expandtab = true;
  smarttab = true;
  shiftwidth = 4;
  shiftround = true;
  textwidth = 80;
  autoindent = true;
  smartindent = true;
  foldlevelstart = 99;

  virtualedit = "block";
  encoding = "utf-8";
  fileformats = "unix,mac,dos";
  backup = false;
  backupskip = "/tmp/*,$TMP/*,*/build/*";
  undofile = true;
  history = 2000;
  shada = "!,'300,<50,@100,s10,h";
}

local disabled_builtin_plugins = {
  "netrw";
  "netrwPlugin";
  "netrwSettings";
  "netrwFileHandlers";
  "gzip";
  "zip";
  "zipPlugin";
  "tar";
  "tarPlugin";
  "getscript";
  "getscriptPlugin";
  "vimball";
  "vimballPlugin";
  "2html_plugin";
  "logiPat";
  "rrhelper";
  "spellfile_pulgin";
  "matchit";
  "matchparen";
}

for name, value in pairs(options) do
  vim.o[name] = value
end

for _, plugin in pairs(disabled_builtin_plugins) do
  vim.g["loaded_" .. plugin] = 1
end
