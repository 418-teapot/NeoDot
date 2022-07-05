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
  }
}

treesitter.setup(options)
