-- define keymap function
local function map(mode, lhs, rhs, opts)
  local options = { noremap=true, silent=true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- map leader
vim.g.mapleader = ","

-- map Esc
map("i", "kj", "<Esc>")

-- navigate between buffers
map("n", "<Leader>b", ":b#<CR>")

-- for nvim-tree.lua
map("n", "<F2>", ":NvimTreeToggle<CR>")

-- for fzf.vim
map("n", "<Leader>f", ":Files<CR>")
map("n", "<Leader>r", ":Rg<CR>")
