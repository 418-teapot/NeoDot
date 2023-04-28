local mr = require("mason-registry")

local ensure_installed = {
  "lua-language-server",
  "clangd",
}

local ensure_install = function()
  for _, tool in ipairs(ensure_installed) do
    local p = mr.get_package(tool)
    if not p:is_installed() then
      p:install()
    end
  end
end

-- if mr.refresh then
--   mr.refresh(ensure_install)
-- else
--   ensure_install()
-- end

require("mason").setup({})
