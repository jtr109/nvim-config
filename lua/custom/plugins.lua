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
  use 'wbthomason/packer.nvim' -- Packer can manage itself
  use 'tpope/vim-repeat' -- repeat.vim
  use "lewis6991/gitsigns.nvim" -- Git status line in side
  use "windwp/nvim-autopairs" -- auto complete brackets
  use { 'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons' } -- manage buffers as tab style
  use "moll/vim-bbye" -- prevent exit vim even closing last buffer
  use "akinsho/toggleterm.nvim" -- open terminal
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } } -- status line
  use "romainl/vim-cool" -- auto nohl after searching
  use 'simrat39/symbols-outline.nvim'
  use 'dstein64/vim-startuptime' -- obtain startup time
  use 'easymotion/vim-easymotion' -- quick motion/jump

  -- Comment
  use 'tpope/vim-commentary' -- comment
  -- use 'numToStr/Comment.nvim' -- Alternative of 'tpope/vim-commentary'
  use 'JoosepAlviste/nvim-ts-context-commentstring' -- Support comment string in context. Usually required in JSX.

  -- File explorer
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optioinal, for file icons
    },
  }

  -- cmp
  use 'hrsh7th/nvim-cmp' -- The completion plugin
  use 'hrsh7th/cmp-buffer' -- buffer completions
  use 'hrsh7th/cmp-path' -- path completions
  use 'hrsh7th/cmp-cmdline' -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in language server client
  use 'hrsh7th/cmp-nvim-lua' -- Autocomplete NeoVim Lua API
  use 'folke/which-key.nvim' -- a popup with possible keybindings

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'

  -- Colorschemes
  use "folke/tokyonight.nvim"
  use "kaicataldo/material.vim"
  use "dracula/vim"
  use "rakr/vim-one"

  -- fuzzy finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  -- treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ":TSUpdate" } -- syntax highlight. The failure on first installation is as expected.
  use 'windwp/nvim-ts-autotag' -- auto close html/xml tags

  -- c#
  use "Hoffs/omnisharp-extended-lsp.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
