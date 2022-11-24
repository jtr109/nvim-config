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
vim.api.nvim_create_user_command(
	'Rg2',
	"call fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case '.<q-args>, 1, fzf#vim#with_preview(), <bang>0)",
	{ bang = true, nargs = '*' }
)
map("n", "<Leader>ff", ":Files<CR>")
map("n", "<Leader>fa", ":Rg<CR>")
map("n", "<Leader>fi", ":Rg2 ")

-- for leap.vim
vim.keymap.set({"n", "x", "o"}, "<Leader>s", "<Plug>(leap-forward-to)")
vim.keymap.set({"n", "x", "o"}, "<Leader>x", "<Plug>(leap-forward-till)")
vim.keymap.set({"n", "x", "o"}, "<Leader>S", "<Plug>(leap-backward-to)")
vim.keymap.set({"n", "x", "o"}, "<Leader>X", "<Plug>(leap-backward-till)")
vim.keymap.set({"n", "x", "o"}, "<Leader>gs", "<Plug>(leap-cross-window)")
