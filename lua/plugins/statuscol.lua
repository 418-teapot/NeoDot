-- All plugins have lazy = true by default.

local opts = function()
  local builtin = require("statuscol.builtin")

  local options = {
    relculright = true,
    segments = {
      {
        text = { builtin.foldfunc },
        click = "v:lua.ScFa",
      },
      {
        text = { "%s" },
        click = "v:lua.ScSa",
      },
      {
        text = { builtin.lnumfunc, " " },
        click = "v:lua.ScLa",
      },
    },
  }

  return options
end

local plugin = {
  {
    "luukvbaal/statuscol.nvim",
    opts = opts,
  },
}

return plugin
