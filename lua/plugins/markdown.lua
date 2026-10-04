-- All plugins have lazy = true by default.

local keys = {
  {
    "<leader>mp",
    "<cmd>MarkdownPreview<cr>",
    mode = "n",
    ft = "markdown",
    desc = "Markdown preview",
  },
  {
    "<leader>ms",
    "<cmd>MarkdownPreviewStop<cr>",
    mode = "n",
    ft = "markdown",
    desc = "Markdown preview stop",
  },
  {
    "<leader>mt",
    "<cmd>MarkdownPreviewToggle<cr>",
    mode = "n",
    ft = "markdown",
    desc = "Markdown preview toggle",
  },
}

local plugin = {
  {
    "iamcco/markdown-preview.nvim",
    ft = {
      "markdown",
    },
    -- use the pre-built binary, no yarn/npm build needed
    build = ":call mkdp#util#install()",
    init = function()
      -- filetypes that get MarkdownPreview commands
      vim.g.mkdp_filetypes = { "markdown" }

      -- don't open the preview automatically
      vim.g.mkdp_auto_start = 0
      -- close the preview when leaving the markdown buffer
      vim.g.mkdp_auto_close = 1
      -- refresh on save / leaving insert instead of on every change
      vim.g.mkdp_refresh_slow = 0
      -- keep MarkdownPreview commands limited to markdown filetypes
      vim.g.mkdp_command_for_global = 0
      -- echo the preview url in the command line
      vim.g.mkdp_echo_preview_url = 1
      -- match the dark colorscheme
      vim.g.mkdp_theme = "dark"
    end,
    keys = keys,
  },
}

return plugin
