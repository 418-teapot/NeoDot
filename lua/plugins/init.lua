local ok, packer = pcall(require, "plugins.packer")
local powerline = false

if not ok then
  return false
end

local use = packer.use

return packer.startup(function()
  use {
    "wbthomason/packer.nvim",
    event = "VimEnter",
  }
  use {
    "EdenEast/nightfox.nvim",
  }
  use {
    "kyazdani42/nvim-web-devicons",
    opt = powerline,
  }
  use {
    "feline-nvim/feline.nvim",
    requires = {
      "kyazdani42/nvim-web-devicons",
      opt = powerline,
    },
    config = function()
      require("feline").setup({
        preset = "noicon"
      })
    end
  }
  use {
    "akinsho/bufferline.nvim",
    requires = {
      "kyazdani42/nvim-web-devicons",
      opt = powerline,
    },
    config = function()
      require("bufferline").setup({
        options = {
          numbers = "ordinal",
        }
      })
    end
  }
  use {
    "norcalli/nvim-colorizer.lua",
    ft = {"html", "css", "vim", "javascript", "typescript"},
    config = function()
      require("colorizer").setup({
        rgb_fn = true,
      })
    end
  }
  use {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      vim.api.nvim_command("set foldmethod=expr")
      vim.api.nvim_command("set foldexpr=nvim_treesitter#foldexpr()")
      require("nvim-treesitter.configs").setup({
        ensure_installed = "maintained",
        highlight = {
          enable = true,
        }
      })
    end
  }
  use {
    "nvim-treesitter/nvim-treesitter-textobjects",
    config = function()
      require("nvim-treesitter.configs").setup({
        textobjects = {
          select = {
            enable = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
            },
          },
        },
      })
    end
  }
end)
