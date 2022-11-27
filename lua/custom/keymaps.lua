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
keymap("n", "<Leader>bb", ":b#<CR>", opts)
keymap("n", "<Leader>bn", ":bnext<CR>", opts)
keymap("n", "<Leader>bp", ":bprevious<CR>", opts)

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

-- for nvim-tree.lua
keymap("n", "<F2>", ":NvimTreeToggle<CR>", opts)

-- for fzf.vim
-- vim.api.nvim_create_user_command(
-- 	'Rg2',
-- 	"call fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case '.<q-args>, 1, fzf#vim#with_preview(), <bang>0)"
-- 	,
-- 	{ bang = true, nargs = '*' }
-- )
-- keymap("n", "<Leader>ff", ":Files<CR>", opts)
-- keymap("n", "<Leader>fa", ":Rg<CR>", opts)
-- keymap("n", "<Leader>fi", ":Rg2 ", opts)

-- for leap.vim
vim.keymap.set({ "n", "x", "o" }, "<Leader>s", "<Plug>(leap-forward-to)", opts)
vim.keymap.set({ "n", "x", "o" }, "<Leader>x", "<Plug>(leap-forward-till)", opts)
vim.keymap.set({ "n", "x", "o" }, "<Leader>S", "<Plug>(leap-backward-to)", opts)
vim.keymap.set({ "n", "x", "o" }, "<Leader>X", "<Plug>(leap-backward-till)", opts)
vim.keymap.set({ "n", "x", "o" }, "<Leader>gs", "<Plug>(leap-cross-window)", opts)

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
