require('mycolors.mynvimscheme').setup()
require("config.lazy")
require("config.myoptions")
require("plugins.telescope")
require("plugins.blankline")
require("plugins.lualine")
require("plugins.colorizer")
require("plugins.bufferline")
require("plugins.mason")
require("plugins.nvim-tree")
require("plugins.lsp")
require("plugins.completion")

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
