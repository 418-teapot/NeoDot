local options = {
  defaults = {
    prompt_prefix = " ",
    sorting_strategy = "ascending",
    file_ignore_patterns = {
      ".git/",
    },
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    path_display = {
      "truncate",
    },
    set_ebv = {
      ["COLORTERM"] = "truecolor",
    },
  },
}

return options
