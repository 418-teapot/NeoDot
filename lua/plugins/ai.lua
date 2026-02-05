-- All plugins have lazy = true by default.

local keys = {
  {
    "<C-a>",
    "<cmd>AvanteToggle<cr>",
    desc = "Toggle Avante",
  },
}

local opts = {
  instructions_file = "AGENTS.md",
  provider = "claude-code",
  acp_provides = {
    ["claude-code"] = {
      command = "npx",
      args = { "@zed-industries/claude-code-acp" },
      env = {
        NODE_NO_WARNINGS = "1",
      },
      -- set more env varibales in ~/.claude/settings.json, for example:
      --
      -- {
      --   "env": {
      --     "ANTHROPIC_BASE_URL": "http://xxx",
      --     "ANTHROPIC_AUTH_TOKEN": "sk-xxx"
      --   }
      -- }
    },
  },
}

local plugins = {
  "yetone/avante.nvim",
  build = "make",
  version = false,
  opts = opts,
  keys = keys,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
}

return plugins
