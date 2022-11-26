require('lspconfig')['sumneko_lua'].setup{
	settings = {
		Lua = {
			diagnostics = {
				-- Let the language server to recognize the `vim` global
				globals = { 'vim' },
			}
		}
	}
}
