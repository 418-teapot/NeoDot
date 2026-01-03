-- All plugins have lazy = true by default.

local ensure_installed = {
  -- LSP
  "bash-language-server",
  "clangd",
  "lua-language-server",
  "python-lsp-server",
  "ruff",
  "rust-analyzer",
  "zls",
  -- DAP
  "codelldb",
  -- Linter
  -- Formatter
}

local config = function()
  require("mason").setup({})

  local registry = require("mason-registry")

  local ensure_install = function()
    for _, tool in ipairs(ensure_installed) do
      local p = registry.get_package(tool)
      if not p:is_installed() then
        p:install()
      end
    end
  end

  if registry.refresh then
    registry.refresh(ensure_install)
  else
    ensure_install()
  end
end

local plugin = {
  {
    "williamboman/mason.nvim",
    cmd = {
      "Mason",
      "MasonInstall",
      "MasonUninstall",
      "MasonUninstallAll",
      "MasonLog",
    },
    build = ":MasonUpdate",
    config = config,
  },
}

return plugin
