vim.cmd("packadd packer.nvim")

local plugins = {
  ["wbthomason/packer.nvim"] = {},
}

require("core.packer").run(plugins)
