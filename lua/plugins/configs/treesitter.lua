local present, treesitter = pcall(require, "nvim-treesitter.configs")

if not present then
  return
end

local options = {
  -- if you want to install the parsers to a custom directory
  -- you can use `parser_install_dir`
  -- the default path is:
  -- ~/.local/share/nvim/site/pack/packer/opt/nvim-treesitter/parser
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
    "verilog",
    "vim",
    "yaml"
  },
  highlight = {
    enable = true,
    use_languagetree = true
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",
      node_incremental = "<CR>",
      scope_incremental = "<TAB>",
      node_decremental = "<BS>"
    }
  },
  -- indent = {
  --   enable = true
  -- },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner"
      }
    }
  }
}

vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"

treesitter.setup(options)
