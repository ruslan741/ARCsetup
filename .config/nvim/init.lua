require('mycolors.mynvimscheme').setup()
require("config.keybinds")
require("config.packer")
require("plugins.telescope")
require("plugins.blankline")
require("plugins.lualine")
require("plugins.colorizer")
require("plugins.bufferline")
vim.opt.clipboard = "unnamedplus"
vim.cmd("set mouse")
vim.cmd("set autoindent")
vim.cmd("set smarttab")
vim.cmd("set relativenumber")
vim.cmd("set number")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

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
