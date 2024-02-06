local overrides = require("custom.configs.overrides")

local plugins = {
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "windwp/nvim-ts-autotag",
    ft = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact"
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "stevearc/conform.nvim",
    --  for users those who want auto-save conform + lazyloading!
    -- event = "BufWritePre"
    config = function()
      require "custom.configs.conform"
    end,
  },

  -- Rust
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },

  {
    'mrcjkb/rustaceanvim',
    version = '^4', -- Recommended
    ft = { 'rust' },
  },

  {
    "saecki/crates.nvim",
    ft = {"rust", "toml"},
    config = function(_, opts)
      local crates = require("crates")
      crates.setup(opts)
      crates.show()
    end
  },

  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local M = require "plugins.configs.cmp"
      table.insert(M.sources, {name = "crates"})
      return M
    end
  },

  -- DAP
  {
    "mfussenegger/nvim-dap"
  },

  -- Copilot
  {
    "github/copilot.vim",
    lazy = false,
    config = function ()
     vim.g.copilot_no_tab_map = true;
      vim.g.copilot_assume_mapped = true;
      vim.g.copilot_tab_fallback = "";
    end
  },

{
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
}

return plugins
