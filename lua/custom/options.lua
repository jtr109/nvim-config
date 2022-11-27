-- disable netrw at the very start of your init.lua (strongly advised)
-- dependences:
--   - nvim-tree.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- :help options
local options = {
	clipboard = 'unnamedplus', -- enable system clipboard
	cursorline = true, -- highlight cursor line
	mouse = 'a', -- enable mouse
	number = true, -- show line number
	relativenumber = true, -- relative line number
	smartcase = true, -- smart case on search
	termguicolors = true, -- set termguicolors to enable highlight groups
}
for k, v in pairs(options) do
	vim.opt[k] = v
end
