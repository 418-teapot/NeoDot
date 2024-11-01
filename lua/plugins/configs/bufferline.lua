local options = {
  options = {
    offsets = {
      {
        filetype = "NvimTree",
        text = "פּ File Explorer",
        highlight = "Directory",
        text_align = "left",
      },
    }, -- offsets
    numbers = function(opts)
      local state = require("bufferline.state")
      for i, buf in ipairs(state.visible_components) do
        if buf.id == opts.id then
          return i
        end
      end
      return opts.ordinal
    end, -- numbers
  },
}

return options
