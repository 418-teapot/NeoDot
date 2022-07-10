local present, whichkey = pcall(require, "which-key")

if not present then
  return
end

local options = {
  layout = {
    spacing = 4, -- spacing between columns
  }
}

require("core.utils").load_mappings()

whichkey.setup(options)
