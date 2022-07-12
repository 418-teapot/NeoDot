local present, installer = pcall(require, "nvim-lsp-installer")

if not present then
  return
end

local options = {
  ensure_installed = {
    "clangd",
    "sumneko_lua",
    "rust_analyzer",
  },
  automatic_installation = true,
  ui = {
    icons = {
      server_installed = " ",
      server_pending = " ",
      server_uninstalled = "ﮊ ",
    }
  }
}

installer.setup(options)
