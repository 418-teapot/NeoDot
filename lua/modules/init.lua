local global = require('core.global')
local vim_path = global.vim_path
local data_dir = global.data_dir
local modules_dir = global.modules_dir
local packer_compiled = global.packer_compiled
local compile_to_lua = global.compile_to_lua
local packer = nil

local Packer = {}
Packer.__index = Packer

function Packer:load_plugins()
  self.repos = {}

  local get_plugins_list = function()
    local list = {}
    local plugins = vim.split(vim.fn.globpath(modules_dir, '*/plugins.lua'), '\n')
    for _, plugin in ipairs(plugins) do
      list[#list+1] = plugin:sub(#modules_dir - 6, -1)
    end
    return list
  end

  local plugins_file = get_plugins_list()
  for _, plugin in ipairs(plugins_file) do
    local repos  = require(plugin:sub(0, #plugin-4))
    for repo, conf in pairs(repos) do
      self.repos[#self.repos+1] = vim.tbl_extend('force', {repo}, conf)
    end
  end
end

function Packer:load_packer()
  if not packer then
    vim.api.nvim_command('packadd packer.nvim')
    packer = require('packer')
  end
  packer.init({
    compile_path = packer_compiled,
    git = {clone_timeout = 120},
    disable_commands = true
  })
  packer.reset()
  local use = packer.use
  self:load_plugins()
  use {
    "wbthomason/packer.nvim", 
    opt = true
  }
  for _, repo in ipairs(self.repos) do
    use(repo)
  end
end

function Packer:init_ensure_plugins()
  local packer_dir = data_dir .. 'pack/packer/opt/packer.nvim'
  local state = vim.loop.fs_stat(packer_dir)
  if not state then
    local cmd = "!git clone https://github.com/wbthomason/packer.nvim " .. packer_dir
    vim.api.nvim_command(cmd)
    vim.loop.fs_mkdir(data_dir .. 'lua', 511, function()
      assert("make compile path dir faield")
    end)
    self:load_packer()
    packer.install()
  end
end

local plugins = setmetatable({}, {
  __index = function(_, key)
    if not packer then
      Packer:load_packer()
    end
    return packer[key]
  end
})

function plugins.ensure_plugins()
  Packer:init_ensure_plugins()
end

function plugins.convert_compile_file()
  local lines = {}
  local lnum = 1
  lines[#lines+1] = 'vim.cmd [[packadd packer.nvim]]\n'

  for line in io.lines(packer_compiled) do
    lnum = lnum + 1
    if lnum > 15 then
      lines[#lines+1] = line .. '\n'
      if line == 'END' then
        break
      end
    end
  end
  table.remove(lines, #lines)

  if vim.fn.isdirectory(data_dir .. 'lua') ~= 1 then
    os.execute('mkdir -p ' .. data_dir .. 'lua')
  end

  if vim.fn.filereadable(compile_to_lua) == 1 then
    os.remove(compile_to_lua)
  end

  local file = io.open(compile_to_lua, "w")
  for _, line in ipairs(lines) do
    file:write(line)
  end
  file:close()

  os.remove(packer_compiled)
end

function plugins.magic_compile()
  plugins.compile()
  plugins.convert_compile_file()
end

function plugins.auto_compile()
  local file = vim.fn.expand('%:p')
  if file:match(modules_dir) then
    plugins.clean()
    plugins.compile()
    plugins.convert_compile_file()
  end
end

function plugins.load_compile()
  if vim.fn.filereadable(compile_to_lua) == 1 then
    require('_compiled')
  else
    assert('Missing packer compile file Run PackerCompile Or PackerInstall to fix')
  end
  vim.cmd [[command! PackerCompile lua require('modules').magic_compile()]]
  vim.cmd [[command! PackerInstall lua require('modules').install()]]
  vim.cmd [[command! PackerUpdate lua require('modules').update()]]
  vim.cmd [[command! PackerSync lua require('modules').sync()]]
  vim.cmd [[command! PackerClean lua require('modules').clean()]]
  vim.cmd [[autocmd User PackerComplete lua require('modules').magic_compile()]]
  vim.cmd [[command! PackerStatus lua require('packer').status()]]
end

return plugins
