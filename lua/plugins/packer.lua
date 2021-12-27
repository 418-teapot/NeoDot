vim.cmd [[packadd packer.nvim]]

local ok, packer = pcall(require, "packer")

if not ok then
  local packer_path = vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

  print "Cloning packer ... "
  
  vim.fn.delete(packer_path, "rf")
  vim.fn.system {
    "git", "clone", "https://github.com/wbthomason/packer.nvim", "--depth", "20", packer_path,
  }

  vim.cmd [[packeradd packer.nvim]]
  ok, packer = pcall(require, "packer")

  if ok then
    print "Packer install successfully."
  else
    error("Couldn't clone packer !\nPacker path: " .. packer_path .. "\n" .. packer)
  end
end

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "single" }
    end,
    prompt_border = "single",
  },
  git = {
    clone_timeout = 6000,
  },
}

return packer
