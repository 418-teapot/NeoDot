local present, treesitter = pcall(require, "nvim-treesitter.configs")

if not present then
  return
end

local options = {
  -- if you want to install the parsers to a custom directory
  -- you can use `parser_install_dir`
  -- the default path is:
  -- ~/.local/share/nvim/lazy/nvim-treesitter/parser
  ensure_installed = {
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
    "ocaml",
    "perl",
    "python",
    "ruby",
    "rust",
    "scala",
    "typescript",
    "toml",
    "verilog",
    "vim",
    "yaml"
  }, -- ensure_installed
  highlight = {
    enable = true,
    use_languagetree = true
  }, -- highlight
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",
      node_incremental = "<CR>",
      scope_incremental = "<TAB>",
      node_decremental = "<BS>"
    }, -- keymap
  }, -- incremental_selection
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner"
      },
    }, -- select
  }, -- textobjects
} -- options

treesitter.setup(options)