local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end
treesitter.setup{
	ensure_installed = {
		"lua",
		"c_sharp",
		"vim",
	},
	context_commentstring = {
		enable = true,
	},
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
}
