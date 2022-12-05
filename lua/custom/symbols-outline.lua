local status_ok, plugin = pcall(require, "symbols-outline")
if not status_ok then
	return
end
plugin.setup()
