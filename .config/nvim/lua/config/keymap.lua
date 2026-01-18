local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })


--nvim-tree
vim.keymap.set('n', '<Leader>e', ':NvimTreeToggle<CR>', { silent = true, desc = "Toggle NvimTree" })
vim.keymap.set('n', '<Leader>f', ':NvimTreeFindFile<CR>', { silent = true, desc = "Find file in NvimTree" })
vim.keymap.set('n', '<Leader>E', ':NvimTreeFocus<CR>', { silent = true, desc = "Focus NvimTree" })

-- Если tree открыто, закрыть, иначе открыть
vim.keymap.set('n', '<C-n>', function()
  local tree = require("nvim-tree.api").tree
  tree.toggle({ focus = false })
end, { desc = "Toggle NvimTree" })

--bufferline
vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", { noremap = true, silent = true })
