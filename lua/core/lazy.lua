local M = {}

M.bootstrap = function(install_path)
  print("Bootstrapping lazy.nvim ..")

  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    install_path,
  }
end

return M
