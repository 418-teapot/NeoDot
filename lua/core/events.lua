local M = {}

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- set indent for different file type
M.indent = function()
  local group = augroup("Indent", {})
  autocmd("FileType", {
    pattern = "make",
    group = group,
    callback = function()
      vim.bo.expandtab = false
    end
  })
  autocmd("FileType", {
    pattern = {"c", "cpp", "cc", "js", "ts", "lua"},
    group = group,
    callback = function()
      vim.bo.shiftwidth = 2
      vim.bo.tabstop = 2
      vim.bo.softtabstop = 2
    end
  })
end

-- don't auto commenting new lines
M.comment = function()
  local group = augroup("Comments", {})
  autocmd("BufEnter", {
    pattern = "*",
    group = group,
    callback = function()
      vim.bo.formatoptions = "jql"
    end
  })
end

-- auto jump to the last viewed position
M.jump = function()
  local group = augroup("Jump", {})
  autocmd("BufReadPost", {
    pattern = "*",
    group = group,
    callback = function()
      local lastview = vim.api.nvim_buf_get_mark(0, '"')
      local lastline, _ = unpack(lastview)
      if lastline ~= 0 then
        vim.api.nvim_win_set_cursor(0, lastview)
      end
    end
  })
end

-- lazy load plugins
local lazy_load = function(tb)
  local group = augroup(tb.augroup_name, {})
  autocmd(tb.events, {
    pattern = "*",
    group = group,
    callback = function()
      if tb.condition() then
        vim.api.nvim_del_augroup_by_id(group)
        vim.cmd("PackerLoad " .. tb.plugins)
      end
    end
  })
end

M.colorizer = function()
  lazy_load({
    events = { "BufRead", "BufNewFile" },
    augroup_name = "ColorizerLazyLoad",
    plugins = "nvim-colorizer.lua",
    condition = function()
      local items = { "#", "rgb", "hsl", "rgba", "hsla" }
      for _, val in ipairs(items) do
        if vim.fn.search(val) ~= 0 then
          return true
        end
      end
    end
  })
end

-- load certain plugins only when there's a file opened in the buffer
-- if "nvim filename" is executed -> load the plugin after vim gui loads
-- this gives an instant preview of nvim with the file opened
M.on_file_open = function(plugin_name)
  lazy_load({
    events = { "BufRead", "BufWinEnter", "BufNewFile" },
    augroup_name = plugin_name .. "LazyLoadOnFileOpen",
    plugins = plugin_name,
    condition = function()
      local file = vim.fn.expand("%")
      return file ~= "NvimTree_1" and file ~= "[packer]" and file ~= ""
    end
  })
end

M.gitsigns = function()
  lazy_load({
    events = { "BufRead", "BufWinEnter", "BufNewFile" },
    augroup_name = "GitsignsLazyLoad",
    plugins = "gitsigns.nvim",
    condition = function()
      local file = vim.fn.expand("%")
      if file ~= "NvimTree_1" and file ~= "[packer]" and file ~= "" then
        local git_exist, _, _ = os.execute("git ls-files --error-unmatch " .. file .. " > /dev/null")
        return git_exist
      end
    end
  })
end

return M
