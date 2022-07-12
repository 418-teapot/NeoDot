local M = {}

M.toggle_theme = function()
  local style = vim.go.background
  if style == "dark" then
    style = "light"
  else
    style = "dark"
  end
  vim.go.background = style
  local present, _ = pcall(require, "indent_blankline")
  if not present then
    return
  end
  local context_bg = require("onedark.colors")["bg2"]
  vim.cmd("highlight IndentBlanklineContextStart guibg=" .. context_bg .. " gui=nocombine")
end

M.load_mappings = function(mappings, mapping_opt)
  -- set mapping function with/without whichkey
  local map_func
  local present, whichkey = pcall(require, "which-key")

  if present then
    map_func = function(keybind, mapping_info, opts)
      whichkey.register({ [keybind] = mapping_info}, opts)
    end
  else
    map_func = function(keybind, mapping_info, opts)
      local mode = opts.mode
      opts.mode = nil
      vim.keymap.set(mode, keybind, mapping_info[1], opts)
    end
  end

  mappings = mappings or vim.deepcopy(require("core.mappings"))
  mappings.lspconfig = nil

  for _, section_mappings in pairs(mappings) do
    for mode, mode_mappings in pairs(section_mappings) do
      for keybind, mapping_info in pairs(mode_mappings) do
        local opts = vim.tbl_deep_extend("force", { mode = mode }, mapping_opt or {})
        map_func(keybind, mapping_info, opts)
      end
    end
  end
end

return M
