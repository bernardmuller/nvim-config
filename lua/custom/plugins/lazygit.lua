vim.pack.add {
  'https://github.com/nvim-lua/plenary.nvim', -- dependency (no-op if present)
  'https://github.com/kdheepak/lazygit.nvim',
}

vim.keymap.set('n', '<leader>lg', '<cmd>LazyGit<cr>', { desc = '[L]azy[G]it' })
