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

local config = function()
  local TS = require("nvim-treesitter")

  -- cache of installed parsers: name -> true
  local installed = {}
  local query_cache = {} -- key: "lang:query" -> boolean

  local function refresh_installed()
    installed = {}
    for _, lang in ipairs(TS.get_installed("parsers")) do
      installed[lang] = true
    end
  end
  refresh_installed()

  -- Install missing parsers asynchronously (does not block startup).
  local missing = vim.tbl_filter(function(lang)
    return not installed[lang]
  end, ensure_installed)
  if #missing > 0 then
    TS.install(missing, { summary = true }):await(function()
      refresh_installed()
    end)
  end

  -- Simplified version of LazyVim's `have()`: check that the parser for the
  -- filetype is installed and (optionally) that the query group exists.
  local function have(ft, query)
    local lang = vim.treesitter.language.get_lang(ft)
    if lang == nil or not installed[lang] then
      return false
    end
    if query then
      local key = lang .. ":" .. query
      if query_cache[key] == nil then
        query_cache[key] = vim.treesitter.query.get(lang, query) ~= nil
      end
      return query_cache[key]
    end
    return true
  end

  -- Highlighting via Neovim 0.12 built-in `vim.treesitter.start`.
  vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup(
      "treesitter_highlight",
      { clear = true }
    ),
    callback = function(ev)
      if have(ev.match, "highlights") then
        vim.treesitter.start(ev.buf)
      end
    end,
  })
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
