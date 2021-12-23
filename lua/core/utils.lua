local M = {}

local home = os.getenv("HOME")
local os = vim.loop.os_uname().sysname
local vim_path = vim.fn.stdpath("config")
local data_dir = string.format("%s/site/", vim.fn.stdpath("data"))

M.misc = {
    home = home,
    os = os,
    is_mac = os == "Darwin",
    is_linux = os == "Linux",
    is_windows = os == "Windows",
    vim_path = vim_path,
    cache_dir = home .. "/.cache/nvim/",
    data_dir = data_dir,
    modules_dir = vim_path .. "/lua/modules/",
    packer_compiled = data_dir .. "packer_compiled.vim",
    complie_to_lua = data_dir .. "lua/_compiled.lua",
}

M.create_dirs = function()
  local dirs = {
    M.misc.cache_dir,
    M.misc.cache_dir .. "backup",
    M.misc.cache_dir .. "session",
    M.misc.cache_dir .. "swap",
    M.misc.cache_dir .. "tags",
    M.misc.cache_dir .. "undo",
    M.misc.cache_dir .. "view",
  }

  for _, dir in pairs(dirs) do
    if vim.fn.isdirectory(dir) == 0 then
      os.execute("mkdir -p " .. dir)
    end
  end
end

return M
