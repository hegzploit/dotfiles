local map = vim.api.nvim_set_keymap
-- Splits
map('n', '|', ':vs<CR>', { noremap = true })
map('n', '-', ':sp<CR>', { noremap = true })

-- Split Navigation
map('n', '<C-L>', '<C-W><C-L>', { noremap = true })
map('n', '<C-H>', '<C-W><C-H>', { noremap = true })
map('n', '<C-K>', '<C-W><C-K>', { noremap = true })
map('n', '<C-J>', '<C-W><C-J>', { noremap = true })

-- Tabs
map('n', 'tn', ':tabnew<CR>', { noremap = true })
map('n', 'tk', ':tabnext<CR>', { noremap = true })
map('n', 'tj', ':tabprev<CR>', { noremap = true })
map('n', 'to', ':tabo<CR>', { noremap = true })
map('n', 'tc', ':tabc<CR>', { noremap = true })

map('n', '<C-S>', ':%s/', { noremap = true })
map('n', '<leader>t', ':sp<CR> :term<CR> :resize 20N<CR> i', {noremap = true, silent = true})
map('t', '<Esc>', '<C-\\><C-n>', {noremap = true, silent = true})

-- Neovim Tree
map('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true})

