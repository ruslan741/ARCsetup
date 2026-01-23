vim.opt.clipboard = "unnamedplus"
vim.cmd("set mouse")
vim.cmd("set autoindent")
vim.cmd("set smarttab")
vim.cmd("set relativenumber")
vim.cmd("set number")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
--vim.opt.list = true
--vim.opt.listchars = {
--    space = "⋅",
--}
