local present, nvimtree = pcall(require, "nvim-tree")

if not present then
  return
end

nvimtree.setup()
