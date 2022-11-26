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

-- for lsp
-- map("n", "<leader>fu", ":Telescope lsp_references<CR>")
-- map("n", "<leader>gd", ":Telescope lsp_definitions<CR>")
-- map("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>")
-- map("n", "<leader>dn", ":lua vim.lsp.diagnostic.goto_next()<CR>")
-- map("n", "<leader>dN", ":lua vim.lsp.diagnostic.goto_prev()<CR>")
-- map("n", "<leader>dd", ":Telescope lsp_document_diagnostics<CR>")
-- map("n", "<leader>dD", ":Telescope lsp_workspace_diagnostics<CR>")
-- map("n", "<leader>xx", ":Telescope lsp_code_actions<CR>")
-- map("n", "<leader>xd", ":%Telescope lsp_range_code_actions<CR>")
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
map("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>")
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
map("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>")
map("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>")
map("n", "<leader>li", "<cmd>LspInfo<cr>")
map("n", "<leader>lI", "<cmd>LspInstallInfo<cr>")
map("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>")
map("n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>")
map("n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>")
map("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>")
map("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
map("n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>")
