vim.cmd("silent! command! ToggleTheme lua require('core.utils').toggle_theme()")

local autocmds = require("core.events")

autocmds.indent()
autocmds.comment()
autocmds.jump()
