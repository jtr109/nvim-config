-- START nvim-tree.lua
require('nvim-tree').setup()
-- END nvim-tree.lua

-- START leap.nvim
require('leap').add_default_mappings()
-- END leap.nvim

-- -- START nvim-cmp / cmp-nvim-lsp
-- -- autocomplete config
-- local cmp = require 'cmp'
-- cmp.setup {
--   mapping = {
--     ['<Tab>'] = cmp.mapping.select_next_item(),
--     ['<S-Tab>'] = cmp.mapping.select_prev_item(),
--     ['<CR>'] = cmp.mapping.confirm({
--       behavior = cmp.ConfirmBehavior.Replace,
--       select = true,
--     })
--   },
--   sources = {
--     { name = 'nvim_lsp' },
--   }
-- }
-- -- END nvim-cmp / cmp-nvim-lsp

-- -- omnisharp lsp config
-- require'lspconfig'.omnisharp.setup {
--   -- capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
--   capabilities = require('cmp_nvim_lsp').default_capabilities(),
--   on_attach = function(_, bufnr)
--     vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
--   end,
--   cmd = { "C:\\Users\\liryan\\omnisharp-win-x64-net6.0\\OmniSharp.exe", "--languageserver" , "--hostPID", tostring(pid) },
-- }

-- START mason
require("mason").setup()
-- END mason

-- LSP
require("mason").setup()
require("mason-lspconfig").setup()
