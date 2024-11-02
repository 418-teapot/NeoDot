-- All plugins have lazy = true by default.

local keys = {
  {
    "zR",
    function()
      require("ufo").openAllFolds()
    end,
    desc = "Open all folds",
  },
  {
    "zM",
    function()
      require("ufo").closeAllFolds()
    end,
    desc = "Close all folds",
  },
}

local handler = function(virtText, lnum, endLnum, width, truncate)
  local newVirtText = {}
  local totalLines = vim.api.nvim_buf_line_count(0)
  local foldedLines = endLnum - lnum
  local suffix = (" 󰁂 %d %d%%"):format(
    foldedLines,
    foldedLines / totalLines * 100
  )
  local sufWidth = vim.fn.strdisplaywidth(suffix)
  local targetWidth = width - sufWidth
  local curWidth = 0
  for _, chunk in ipairs(virtText) do
    local chunkText = chunk[1]
    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
    if targetWidth > curWidth + chunkWidth then
      table.insert(newVirtText, chunk)
    else
      chunkText = truncate(chunkText, targetWidth - curWidth)
      local hlGroup = chunk[2]
      table.insert(newVirtText, { chunkText, hlGroup })
      chunkWidth = vim.fn.strdisplaywidth(chunkText)
      -- str width returned from truncate() may less than 2nd argument, need padding
      if curWidth + chunkWidth < targetWidth then
        suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
      end
      break
    end
    curWidth = curWidth + chunkWidth
  end
  table.insert(newVirtText, { suffix, "MoreMsg" })
  return newVirtText
end

local options = {
  provider_selector = function(bufnr, filetype, buftype)
    return { "treesitter", "indent" }
  end,
  fold_virt_text_handler = handler,
}

local plugin = {
  {
    "kevinhwang91/nvim-ufo",
    event = {
      "BufReadPost",
      "BufNewFile",
    },
    keys = keys,
    opts = function()
      return options
    end,
    dependencies = {
      "kevinhwang91/promise-async",
      "luukvbaal/statuscol.nvim",
    },
  },
}

return plugin
