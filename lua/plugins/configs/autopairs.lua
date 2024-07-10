local autopairs = require("nvim-autopairs")
local cmp = require("cmp")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")

local options = {
  fast_wrap = {},
  disable_filetype = { "TelescopePrompt", "vim" },
}

autopairs.setup(options)

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
