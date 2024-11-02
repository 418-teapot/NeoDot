require("core")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  require("core.lazy").bootstrap(lazypath)
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require("core.lazy").options
require("lazy").setup("plugins", lazy_config)
