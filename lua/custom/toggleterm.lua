local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end
toggleterm.setup({
	open_mapping = [[<Leader>tt]],
	direction = "float",
})

-- lazygit integration
local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
local function _lazygit_toggle()
  lazygit:toggle()
end
vim.keymap.set("n", "<leader>tg", _lazygit_toggle, { desc = "Toggle lazygit" })
