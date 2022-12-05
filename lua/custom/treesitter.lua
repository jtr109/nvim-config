local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end
treesitter.setup{
	ensure_installed = {
		"lua",
		"c_sharp",
		"vim",
    'xml',
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
  autotag = { -- Required nvim-ts-autotag, see https://github.com/windwp/nvim-ts-autotag
    enable = true,
  }
}

local parser_status_ok, parsers = pcall(require, "nvim-treesitter.parsers")
if not parser_status_ok then
	return
end
local parser_config = parsers.get_parser_configs()
parser_config.xml = { -- execute `:TSInstall xml` to install the XML parser
	install_info = {
		url = "https://github.com/Trivernis/tree-sitter-xml",
		files = { "src/parser.c" },
		generate_requires_npm = true,
		branch = "main",
	},
	filetype = "xml",
}
