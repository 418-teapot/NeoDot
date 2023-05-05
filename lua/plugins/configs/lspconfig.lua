local lsp = require("lspconfig")
local mlsp = require("mason-lspconfig")

local servers = {
  bashls = {},
  clangd = {},
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" }
        },
      }
    }
  },
}

local capabilities = vim.tbl_deep_extend("force",
  {},
  vim.lsp.protocol.make_client_capabilities()
  -- require("cmp_nvim_lsp").default_capabilities()
)

local setup = function(server)
  local server_opts = vim.tbl_deep_extend("force",
    { capabilities = vim.deepcopy(capabilities) },
    servers[server] or {}
  )
  lsp[server].setup(server_opts)
end

local ensure_installed = {}

for server, server_opts in pairs(servers) do
  if server_opts then
    server_opts = server_opts == true and {} or server_opts
    ensure_installed[#ensure_installed + 1] = server
  end
end

mlsp.setup({ ensure_installed = ensure_installed })
mlsp.setup_handlers({ setup })
