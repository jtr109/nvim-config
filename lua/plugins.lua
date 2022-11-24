return require('packer').startup(function(use)
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
	use {
		'junegunn/fzf',
		run = function() vim.fn['fzf#install']() end
	}
	use 'junegunn/fzf.vim'
end)

