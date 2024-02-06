return {
    'nvimdev/lspsaga.nvim',
    config = function()
        require('lspsaga').setup({})
    end,
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-tree/nvim-web-devicons'
    },
  mappings = {
    {'n', '<leader>ca', '<cmd>lua require("lspsaga.codeaction").code_action()<CR>'},
    {'v', '<leader>ca', '<cmd>lua require("lspsaga.codeaction").range_code_action()<CR>'},
    {'n', 'K', '<cmd>lua require("lspsaga.hover").render_hover_doc()<CR>'},
    {'n', '<C-f>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>'},
    {'n', '<C-b>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>'},
    {'n', '<leader>rn', '<cmd>lua require("lspsaga.rename").rename()<CR>'},
    {'n', '<leader>cd', '<cmd>lua require("lspsaga.diagnostic").show_line_diagnostics()<CR>'},
    {'n', '[d', '<cmd>lua require("lspsaga.diagnostic").lsp_jump_diagnostic_prev()<CR>'},
    {'n', ']d', '<cmd>lua require("lspsaga.diagnostic").lsp_jump_diagnostic_next()<CR>'},
    {'n', '<leader>q', '<cmd>lua require("lspsaga.floaterm").open_float_terminal()<CR>'},
    {'t', '<leader>q', '<C-\\><C-n>:lua require("lspsaga.floaterm").close_float_terminal()<CR>'},
  }
}
