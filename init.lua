require("core")

local base46path = vim.fn.stdpath("data") .. "/base46/"
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

vim.g.base46_cache = base46path

if not vim.loop.fs_stat(lazypath) then
  require("core.lazy").bootstrap(lazypath)
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require("core.lazy").options
require("lazy").setup("plugins", lazy_config)

for _, v in ipairs(vim.fn.readdir(vim.g.base46_cache)) do
  dofile(vim.g.base46_cache .. v)
end
