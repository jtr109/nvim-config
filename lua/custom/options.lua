-- disable netrw at the very start of your init.lua (strongly advised)
-- dependences:
--   - nvim-tree.lua
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- :help options
local options = {
	clipboard = 'unnamedplus', -- enable system clipboard
	cursorline = true, -- highlight cursor line
	ignorecase = true, -- Ingore case on search. It works with smartcase for search.
	-- mouse = 'a', -- enable mouse
	number = true, -- show line number
	relativenumber = true, -- relative line number
	smartcase = true, -- Smart case on search
	termguicolors = true, -- set termguicolors to enable highlight groups
	list = true, -- visible blanks
	listchars = 'tab:\\u21E5\\u0020,space:\\u00B7',
}
for k, v in pairs(options) do
	vim.opt[k] = v
end

local global_options = {
	-- :help netrw-browse-options
	netrw_browse_split = 4, -- change how files are opened
	netrw_winsize = 25, -- set the width of the directory explorer
}
for k, v in pairs(global_options) do
	vim.g[k] = v
end
