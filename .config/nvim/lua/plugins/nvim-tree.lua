vim.keymap.set('n', '<Leader>e', ':NvimTreeToggle<CR>', { silent = true, desc = "Toggle NvimTree" })
vim.keymap.set('n', '<Leader>f', ':NvimTreeFindFile<CR>', { silent = true, desc = "Find file in NvimTree" })
vim.keymap.set('n', '<Leader>E', ':NvimTreeFocus<CR>', { silent = true, desc = "Focus NvimTree" })

-- Если tree открыто, закрыть, иначе открыть
vim.keymap.set('n', '<C-n>', function()
  local tree = require("nvim-tree.api").tree
  tree.toggle({ focus = false })
end, { desc = "Toggle NvimTree" })
