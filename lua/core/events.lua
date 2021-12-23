local M = {}

M.create_augroups = function(autocmds)
  for group_name, cmds in pairs(autocmds) do
    vim.api.nvim_command("augroup " .. group_name)
    vim.api.nvim_command("autocmd!")
    for _, cmd in ipairs(cmds) do
      local command = table.concat(vim.tbl_flatten{"autocmd", cmd}, " ")
      vim.api.nvim_command(command)
    end
  end
  vim.api.nvim_command("augroup END")
end

local autocmds = {
  ft = {
    {"FileType", "make", "setlocal noexpandtab"};
    {"FileType", "c,cpp,cc,js,ts,lua", "setlocal shiftwidth=2 tabstop=2 softtabstop=2"};
  };
}

M.create_augroups(autocmds)
