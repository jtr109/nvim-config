local servers = {
  "html",
	"sumneko_lua",
	"omnisharp",
  "lemminx",
}

local status_mason_ok, mason_installer = pcall(require, "mason")
if not status_mason_ok then
	return
end
mason_installer.setup()

local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status_ok then
	return
end
mason_lspconfig.setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}

for _, server in pairs(servers) do
	local require_ok, conf_opts = pcall(require, "custom.lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	lspconfig[server].setup(opts)
end
