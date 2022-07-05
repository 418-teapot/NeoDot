local present, toggleterm = pcall(require, "toggleterm")

if not present then
  return
end

local options = {
  size = function(term)
    if term.direction == "horizontal" then
      return 10
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  shade_terminals = false,
  shell = "bash"
}

toggleterm.setup(options)
