local present, comment = pcall(require, "Comment")

if not present then
  return
end

local options = {
  mappings = {
    basic = false,
    extra = false
  }
}

comment.setup(options)
