-- Tree-sitter highlighting is an invariant, not an event:
-- every loaded buffer whose filetype has both a parser and a highlights query
-- must be highlighted, no matter when the buffer or that capability appeared.
--
-- This module only uses Neovim's builtin tree-sitter API, so it can be
-- registered during startup and never depends on a plugin being loaded.
-- Parser *installation* is a separate concern handled by nvim-treesitter's
-- lazily loaded config, which calls `refresh()` once the disk state changed.

local M = {}

---Highlight `buf` if that is currently possible. Idempotent and side-effect
---free when it is not possible: answers from current facts only, never from
---cached assumptions about what is installed.
---@param buf integer
local function highlight(buf)
  if not vim.api.nvim_buf_is_loaded(buf) then
    return
  end
  if vim.treesitter.highlighter.active[buf] then
    return
  end

  local lang = vim.treesitter.language.get_lang(vim.bo[buf].filetype)
  if not lang then
    return
  end

  local ok, loaded = pcall(vim.treesitter.language.add, lang)
  if not ok or not loaded then
    return -- parser not installed (yet)
  end

  if not vim.treesitter.query.get(lang, "highlights") then
    return -- queries not installed (yet)
  end

  pcall(vim.treesitter.start, buf, lang)
end

---Restore the invariant for every buffer that is already loaded.
function M.align()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    highlight(buf)
  end
end

---Restore the invariant after the capabilities on disk changed, e.g. after
---parsers or queries were installed at runtime.
function M.refresh()
  vim.treesitter.query.get:clear() -- drop cached "no such query" answers
  M.align()
end

function M.setup()
  local group = vim.api.nvim_create_augroup("TSHighlight", { clear = true })

  -- Every buffer gets a chance when its filetype is set ...
  vim.api.nvim_create_autocmd("FileType", {
    group = group,
    callback = function(ev)
      highlight(ev.buf)
    end,
  })

  -- ... and one more when startup is over, so buffers that were already
  -- loaded before this module was registered cannot be left behind.
  vim.api.nvim_create_autocmd("VimEnter", {
    group = group,
    once = true,
    callback = function()
      M.align()
    end,
  })
end

return M
