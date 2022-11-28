-- Use a protected call to make sure packer installed
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Show Packer status in a popup window
packer.init {
	display = {
		open_fn = function()
			return require("packer.util").float { border = "rounded" }
		end,
	},
}

local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return packer.startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- File explorer
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optioinal, for file icons
		},
	}

	-- leap.nvim
	use 'ggandor/leap.nvim'

	-- repeat.vim
	use 'tpope/vim-repeat'

	-- comment
	use 'tpope/vim-commentary'

	-- cmp
	use 'hrsh7th/nvim-cmp' -- The completion plugin
	use 'hrsh7th/cmp-buffer' -- buffer completions
	use 'hrsh7th/cmp-path' -- path completions
	use 'hrsh7th/cmp-cmdline' -- cmdline completions
	use "saadparwaiz1/cmp_luasnip" -- snippet completions
	use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in language server client

	-- snippets
	use "L3MON4D3/LuaSnip" --snippet engine
	use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

	-- LSP
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'
	use 'neovim/nvim-lspconfig'

	-- Colorschemes
	use "folke/tokyonight.nvim"

	-- fuzzy finder
	-- use {
	-- 	'junegunn/fzf',
	-- 	run = function() vim.fn['fzf#install']() end
	-- }
	use {
		'nvim-telescope/telescope.nvim',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}

	-- syntax highlight
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)
