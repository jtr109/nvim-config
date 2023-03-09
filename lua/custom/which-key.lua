local status_ok, plugin = pcall(require, "git")
if not status_ok then
	return
end
plugin.setup({
  keymaps = {
    browse = "<leader>go",
  }
})
