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

	-- fzf
	-- use {
	-- 	'junegunn/fzf',
	-- 	run = function() vim.fn['fzf#install']() end
	-- }
	-- use 'junegunn/fzf.vim'

	-- leap.nvim
	use 'ggandor/leap.nvim'

	-- repeat.vim
	use 'tpope/vim-repeat'

	-- comment
	use 'tpope/vim-commentary'

	-- -- nice interface for LSP functions (among other things)
	-- use {
	-- 	'nvim-telescope/telescope.nvim',
	-- 	requires = { { 'nvim-lua/plenary.nvim' } }
	-- }


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
	use {
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		'neovim/nvim-lspconfig',
	}

	-- Colorschemes
	use "folke/tokyonight.nvim"
end)

