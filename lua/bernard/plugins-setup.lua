-- auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
	use("wbthomason/packer.nvim")

	use("nvim-lua/plenary.nvim")

	-- themes
	use("lunarvim/colorschemes")
	use("danilo-augusto/vim-afterglow")
	use("rose-pine/neovim")
	use("sainnhe/sonokai")

	-- transparancy
	use("xiyaowong/nvim-transparent")

	use("christoomey/vim-tmux-navigator")
	use("szw/vim-maximizer")

	-- essentials
	use("tpope/vim-surround")
	use("vim-scripts/ReplaceWithRegister")

	-- comments with gc
	use("numToStr/Comment.nvim")

	-- file explorer
	use("nvim-tree/nvim-tree.lua")

	-- icons
	use("kyazdani42/nvim-web-devicons")

	-- statsline
	use("nvim-lualine/lualine.nvim")

	-- fuzzy finder
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })

	-- auto completion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")

	-- LSP
	-- managing and installing LSP servers
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")

	-- snippets
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	-- configuring LSP servers
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use({ "glepnir/lspsaga.nvim", branch = "main" })
	use("jose-elias-alvarez/typescript.nvim")
	use("onsails/lspkind.nvim")
	use("hrsh7th/cmp-nvim-lua")
	use("hrsh7th/cmp-nvim-lsp-signature-help")
	use("hrsh7th/cmp-vsnip")
	use("hrsh7th/vim-vsnip")

	--formatting and linting
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")

	-- treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})

	-- debugger
	use("mfussenegger/nvim-dap")
	use("leoluz/nvim-dap-go")
	use("rcarriga/nvim-dap-ui")
	use("theHamsta/nvim-dap-virtual-text")
	use("nvim-telescope/telescope-dap.nvim")
	use({ "Pocco81/DAPInstall.nvim" })

	--start screen
	use("startup-nvim/startup.nvim")
	-- auto closing
	use("windwp/nvim-autopairs")
	-- use("windwp/nvim-ts-autotag")

	-- git signs
	use("lewis6991/gitsigns.nvim")

	--git integration
	use("tpope/vim-fugitive")

	-- copilot
	use("github/copilot.vim")

	-- which key
	-- languages

	-- rust
	use("simrat39/rust-tools.nvim")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
