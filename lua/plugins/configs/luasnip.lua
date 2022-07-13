local present, luasnip = pcall(require, "luasnip")

if not present then
  return
end

local options = {
  history = true,
  update_events = "TextChanged,TextChangedI"
}

luasnip.config.set_config(options)

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load({ paths = vim.g.luasnippets_path or "" })
