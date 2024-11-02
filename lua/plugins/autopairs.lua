-- All plugins have lazy = true by default.

local config = function()
  local autopairs = require("nvim-autopairs")
  local cmp = require("cmp")
  local cmp_autopairs = require("nvim-autopairs.completion.cmp")

  local options = {
    disable_filetype = { "TelescopePrompt", "vim" },
  }

  autopairs.setup(options)

  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end

local plugin = {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    dependencies = {
      "nvim-cmp",
    },
    config = config,
  },
}

return plugin
