-- relative line number
vim.o.number = true
vim.o.relativenumber = true

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- disable netrw at the very start of your init.lua (strongly advised)
-- dependences:
--   - nvim-tree.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
