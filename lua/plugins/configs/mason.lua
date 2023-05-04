local ensure_installed = {
  "bash-language-server",
  "clangd",
  "lua-language-server",
}

require("mason").setup({})

local registry = require("mason-registry")

local function ensure_install()
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
