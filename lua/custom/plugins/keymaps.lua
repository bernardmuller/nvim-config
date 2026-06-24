-- Quick escape from insert mode
vim.keymap.set('i', 'jk', '<Esc>', { desc = 'Exit insert mode' })

-- File explorer (netrw)
vim.keymap.set('n', '<leader>E', vim.cmd.Explore, { desc = 'File [E]xplorer' })

-- Move the visual selection (J = down, K = up)
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })

-- Half-page jumps, keeping the cursor centred.
-- NOTE: many terminals can't send <C-,> / <C-.> distinctly; remap if they don't fire.
vim.keymap.set('n', '<C-,>', '<C-d>zz', { desc = 'Half page down (centred)' })
vim.keymap.set('n', '<C-.>', '<C-u>zz', { desc = 'Half page up (centred)' })

-- Keep search matches centred
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next match (centred)' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Prev match (centred)' })

-- Paste over a selection without overwriting the yank register
vim.keymap.set('x', '<leader>p', '"_dP', { desc = 'Paste without yanking selection' })

-- Splits
vim.keymap.set('n', '<leader>|', '<cmd>vsplit<CR>', { desc = 'Split window vertically' })
vim.keymap.set('n', '<leader>_', '<cmd>split<CR>', { desc = 'Split window horizontally' })
