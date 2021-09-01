local config = {}

function config.lualine()
  require'lualine'.setup {
    options = {
      icons_enabled = false,
      theme = 'onedark',
      component_separators = '',
      section_separators = '',
      disabled_filetypes = {}
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch'},
      lualine_c = {'filename'},
      lualine_x = {'encoding', 'fileformat', 'filetype'},
      lualine_y = {'progress'},
      lualine_z = {'location'}
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {'filename'},
      lualine_x = {'location'},
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    extensions = {}
  }
end

function config.bufferline()
  require('bufferline').setup{
    options = {
      numbers = "ordinal",
      modified_icon = '*',
      buffer_close_icon = '',
      always_show_bufferline = true,
    }
  }
end

return config
