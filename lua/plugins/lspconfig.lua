-- All plugins have lazy = true by default.

local keys = {
  { "]d", vim.diagnostic.goto_next, mode = "n", desc = "Next diagnostic" },
  { "[d", vim.diagnostic.goto_prev, mode = "n", desc = "Prev diagnostic" },
  {
    "<leader>q",
    vim.diagnostic.setloclist,
    mode = "n",
    desc = "Diagnostic float window",
  },
}

local servers = {
  -- Mason lsp
  bashls = {},
  clangd = {},
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
      },
    },
  },
  rust_analyzer = {},
  -- Builtin lsp
  nushell = false,
  mlir_lsp_server = false,
  mlir_pdll_lsp_server = false,
  tblgen_lsp_server = false,
}

local config = function()
  local lsp = require("lspconfig")
  local mlsp = require("mason-lspconfig")

  local setup = function(server)
    lsp[server].setup(
      require("blink.cmp").get_lsp_capabilities(servers[server] or {})
    )
  end

  local ensure_installed = {}

  for server, server_opts in pairs(servers) do
    if server_opts then
      server_opts = server_opts == true and {} or server_opts
      ensure_installed[#ensure_installed + 1] = server
    else
      -- lspconfig builtin support
      vim.lsp.enable(server)
    end
  end

  mlsp.setup({
    ensure_installed = ensure_installed,
    handlers = setup,
  })
end

local plugin = {
  {
    "neovim/nvim-lspconfig",
    event = {
      "BufReadPre",
      "BufNewFile",
    },
    keys = keys,
    dependencies = {
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "saghen/blink.cmp",
    },
    config = config,
  },
}

return plugin
