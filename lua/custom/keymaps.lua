local opts = { noremap = true, silent = true }

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
-- vim.keymap.set("n", "<Leader>b", ":b#<CR>", opts)
vim.keymap.set("n", "<Leader>bj", ":BufferLinePick<CR>", opts) -- bi: buffer jump
vim.keymap.set("n", "<A-[>", ":bprevious<CR>", opts)
vim.keymap.set("n", "<A-]>", ":bnext<CR>", opts)
vim.keymap.set("n", "<Leader>bb", ":b#<CR>", opts)
vim.keymap.set("n", "<Leader>bn", ":bnext<CR>", opts)
vim.keymap.set("n", "<Leader>bp", ":bprevious<CR>", opts)

-- resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- move text up and down
vim.keymap.set("n", "<A-j>", ":m .+1<CR>", opts)
vim.keymap.set("n", "<A-k>", ":m .-2<CR>", opts)


-- Visual --

-- stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- move text up and down
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- By default, the replaced text stored in clipboard.
-- Override by settling the yanked text
-- vim.keymap.set("v", "p", '"_dP', opts)


-- Insert --

-- map Esc
vim.keymap.set("i", "<C-k>", "<Esc>", opts)

-- move text up and down
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)


-- Plugins --

-- nvim-tree.lua
vim.keymap.set("n", "<Leader>te", ":NvimTreeToggle<CR>", opts) -- toggle explorer

-- LSP
-- copy from: https://github.com/LunarVim/Neovim-from-scratch/blob/master/lua/user/lsp/handlers.lua
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
vim.keymap.set("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
-- vim.keymap.set("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<cr>", opts) -- deprecated
vim.keymap.set("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format { async = true }<cr>", opts)
vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<cr>", opts)
vim.keymap.set("n", "<leader>lI", "<cmd>LspInstallInfo<cr>", opts)
vim.keymap.set("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
vim.keymap.set("n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
vim.keymap.set("n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
vim.keymap.set("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
vim.keymap.set("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
vim.keymap.set("n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

-- Telescope
-- copy from: https://github.com/nvim-telescope/telescope.nvim#usage
local telescope_builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, { desc = "Find files" })
vim.keymap.set('n', '<leader>fg', telescope_builtin.live_grep, { desc = "Global search" })
vim.keymap.set('n', '<leader>fb', telescope_builtin.buffers, { desc = "Find buffers" })
vim.keymap.set('n', '<leader>fs', telescope_builtin.lsp_dynamic_workspace_symbols,
  { desc = "LSP dynamic workspace symbols" })
-- Or use `lsp_workspace_symbols` to replace `lsp_dynamic_workspace_symbols`. I don't know the difference.
vim.keymap.set('n', '<leader>fc', function()
  telescope_builtin.command_history(
    { sorter = require('telescope.sorters').get_substr_matcher() } -- keep the sort: https://github.com/nvim-telescope/telescope.nvim/issues/1118
  )
end, { desc = "Search command history" })
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- ToggleTerm
-- function _G.set_terminal_keymaps()
-- 	local tt_opts = { noremap = true }
-- 	vim.api.nvim_buf_set_vim.keymap.set(0, 't', '<esc>', [[<C-\><C-n>]], tt_opts)
-- 	vim.api.nvim_buf_set_vim.keymap.set(0, 't', 'jk', [[<C-\><C-n>]], tt_opts)
-- 	vim.api.nvim_buf_set_vim.keymap.set(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], tt_opts)
-- 	vim.api.nvim_buf_set_vim.keymap.set(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], tt_opts)
-- 	vim.api.nvim_buf_set_vim.keymap.set(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], tt_opts)
-- 	vim.api.nvim_buf_set_vim.keymap.set(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], tt_opts)
-- end
-- vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- symbols-outline
vim.keymap.set('n', '<leader>to', "<cmd>SymbolsOutline<cr>", { desc = "Toggle symbols outline window" })

-- spell
vim.keymap.set('n', '<leader>ts', function()
  vim.opt.spell = not vim.opt.spell:get()
  if vim.opt.spell:get() then
    print('Spell check is opened.')
  else
    print('Spell check is closed.')
  end
end, { desc = "Toggle spell" })
