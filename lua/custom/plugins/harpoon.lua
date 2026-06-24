vim.pack.add {
  'https://github.com/nvim-lua/plenary.nvim', -- dependency (already present via telescope; no-op)
  { src = 'https://github.com/ThePrimeagen/harpoon', version = 'harpoon2' },
}

local harpoon = require 'harpoon'
harpoon:setup()

vim.keymap.set('n', '<leader>ha', function() harpoon:list():add() end, { desc = '[H]arpoon [A]dd' })
vim.keymap.set('n', '<leader>he', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = '[H]arpoon [E]xplore' })

vim.keymap.set('n', '<C-8>', function() harpoon:list():select(1) end, { desc = 'Harpoon view 1' })
vim.keymap.set('n', '<C-9>', function() harpoon:list():select(2) end, { desc = 'Harpoon view 2' })
vim.keymap.set('n', '<C-0>', function() harpoon:list():select(3) end, { desc = 'Harpoon view 3' })

vim.keymap.set('n', '<leader>hm', function() harpoon:list():prev() end, { desc = '[H]arpoon [M]ove Back' })
vim.keymap.set('n', '<leader>hn', function() harpoon:list():next() end, { desc = '[H]arpoon Move [N]ext' })
