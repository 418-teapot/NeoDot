local present, lspconfig = pcall(require, "lspconfig")

if not present then
  return
end

local on_attach = function(_, bufnr)
  local lsp_mappings = require("core.mappings").lspconfig
  require("core.utils").load_mappings({lsp_mappings}, {buffer = bufnr})
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

lspconfig.sumneko_lua.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim", "require" }
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true)
      }
    }
  }
})

lspconfig.clangd.setup({
  on_attach = on_attach,
  capabilities = capabilities
})
