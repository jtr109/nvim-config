local opts = { noremap = true, silent = true }

-- shorten function name
local keymap = vim.api.nvim_set_keymap

-- map leader
vim.g.mapleader = ","


-- Modes:
--   noremal mode: "n",
--   insert mode: "i",
--   visual mode: "v",
--   visual block mode: "x",
--   terminal mode: "t",
--   command mode: "c",


-- Normal --

-- buffer navigation
keymap("n", "<Leader>b", ":b#<CR>", opts)
keymap("n", "<A-[>", ":bprevious<CR>", opts)
keymap("n", "<A-]>", ":bnext<CR>", opts)
-- keymap("n", "<Leader>bb", ":b#<CR>", opts)
-- keymap("n", "<Leader>bn", ":bnext<CR>", opts)
-- keymap("n", "<Leader>bp", ":bprevious<CR>", opts)

-- resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- move text up and down
keymap("n", "<A-j>", ":m .+1<CR>", opts)
keymap("n", "<A-k>", ":m .-2<CR>", opts)


-- Visual --

-- stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- move text up and down
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- By default, the replaced text stored in clipboard.
-- Override by settling the yanked text
-- keymap("v", "p", '"_dP', opts)


-- Insert --

-- map Esc
keymap("i", "<C-k>", "<Esc>", opts)

-- move text up and down
keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)


-- Plugins --

-- nvim-tree.lua
keymap("n", "<Leader>te", ":NvimTreeToggle<CR>", opts) -- toggle explorer

-- leap.vim
vim.keymap.set({ "n", "x", "o" }, "<Leader>s", "<Plug>(leap-forward-to)", opts)
vim.keymap.set({ "n", "x", "o" }, "<Leader>x", "<Plug>(leap-forward-till)", opts)
vim.keymap.set({ "n", "x", "o" }, "<Leader>S", "<Plug>(leap-backward-to)", opts)
vim.keymap.set({ "n", "x", "o" }, "<Leader>X", "<Plug>(leap-backward-till)", opts)
vim.keymap.set({ "n", "x", "o" }, "<Leader>gs", "<Plug>(leap-cross-window)", opts)

-- lsp
-- map("n", "<leader>fu", ":Telescope lsp_references<CR>")
-- map("n", "<leader>gd", ":Telescope lsp_definitions<CR>")
-- map("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>")
-- map("n", "<leader>dn", ":lua vim.lsp.diagnostic.goto_next()<CR>")
-- map("n", "<leader>dN", ":lua vim.lsp.diagnostic.goto_prev()<CR>")
-- map("n", "<leader>dd", ":Telescope lsp_document_diagnostics<CR>")
-- map("n", "<leader>dD", ":Telescope lsp_workspace_diagnostics<CR>")
-- map("n", "<leader>xx", ":Telescope lsp_code_actions<CR>")
-- map("n", "<leader>xd", ":%Telescope lsp_range_code_actions<CR>")

-- LSP
-- copy from: https://github.com/LunarVim/Neovim-from-scratch/blob/master/lua/user/lsp/handlers.lua
keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
keymap("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
keymap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<cr>", opts)
keymap("n", "<leader>li", "<cmd>LspInfo<cr>", opts)
keymap("n", "<leader>lI", "<cmd>LspInstallInfo<cr>", opts)
keymap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
keymap("n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
keymap("n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
keymap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
keymap("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
keymap("n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

-- Telescope
-- copy from: https://github.com/nvim-telescope/telescope.nvim#usage
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- ToggleTerm
-- function _G.set_terminal_keymaps()
-- 	local tt_opts = { noremap = true }
-- 	vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], tt_opts)
-- 	vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], tt_opts)
-- 	vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], tt_opts)
-- 	vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], tt_opts)
-- 	vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], tt_opts)
-- 	vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], tt_opts)
-- end
-- vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
