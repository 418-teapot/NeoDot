-- All plugins have lazy = true by default.

local keys = {
  {
    "<leader>e",
    function()
      require("tiny-inline-diagnostic").toggle()
    end,
    mode = "n",
    desc = "toggle inline diagnostic",
  },
}

local config = function()
  require("tiny-inline-diagnostic").setup()
  vim.diagnostic.config({ virtual_text = false })
end

local plugin = {
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    keys = keys,
    config = config,
  },
}

return plugin
