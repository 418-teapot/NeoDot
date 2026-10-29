-- All plugins have lazy = true by default.

-- Parsers to install with the `nvim-treesitter` **main** branch.
-- Highlighting and folding are handled by Neovim 0.12 built-ins,
-- so this list only controls parser installation.
local ensure_installed = {
  "bash",
  "bibtex",
  "c",
  "c_sharp",
  "cmake",
  "comment",
  "cpp",
  "css",
  "cuda",
  "dockerfile",
  "go",
  "haskell",
  "html",
  "java",
  "javascript",
  "json",
  "latex",
  "llvm",
  "lua",
  "make",
  "markdown",
  "markdown_inline",
  "mlir",
  "nu",
  "ocaml",
  "perl",
  "python",
  "ruby",
  "rust",
  "scala",
  "tablegen",
  "typescript",
  "typst",
  "toml",
  "vim",
  "vimdoc",
  "yaml",
} -- ensure_installed

-- The plugin has exactly one job: make parsers and queries available on disk.
-- Highlighting itself is Neovim's builtin job and lives in `core.treesitter`,
-- which is registered at startup, so it never waits for this plugin to load.
local config = function()
  local TS = require("nvim-treesitter")

  local installed = {}
  for _, lang in ipairs(TS.get_installed("parsers")) do
    installed[lang] = true
  end

  local missing = vim.tbl_filter(function(lang)
    return not installed[lang]
  end, ensure_installed)
  if #missing == 0 then
    return
  end

  TS.install(missing, { summary = true }):await(function()
    require("core.treesitter").refresh()
  end)
end

local plugins = {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    event = "VeryLazy",
    cmd = {
      "TSInstall",
      "TSInstallFromGrammar",
      "TSUninstall",
      "TSUpdate",
      "TSLog",
    },
    build = ":TSUpdate",
    config = config,
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-context",
        opts = function()
          require("treesitter-context").setup({
            max_lines = 3,
            trim_scope = "inner",
          })
        end,
      },
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
        config = function()
          require("nvim-treesitter-textobjects").setup({
            select = {
              lookahead = true,
            },
          })

          local select = require("nvim-treesitter-textobjects.select")
          vim.keymap.set({ "x", "o" }, "af", function()
            select.select_textobject("@function.outer", "textobjects")
          end)
          vim.keymap.set({ "x", "o" }, "if", function()
            select.select_textobject("@function.inner", "textobjects")
          end)
          vim.keymap.set({ "x", "o" }, "ac", function()
            select.select_textobject("@class.outer", "textobjects")
          end)
          vim.keymap.set({ "x", "o" }, "ic", function()
            select.select_textobject("@class.inner", "textobjects")
          end)
        end,
      },
    },
  },
}

return plugins
