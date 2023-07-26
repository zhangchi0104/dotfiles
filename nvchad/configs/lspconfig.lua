local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

-- if you just want default config for the servers then put them in a table
local servers = {
	pyright = {
		python = {
			inlayHints = false,
		},
	},
	tsserver = {},
	rust_analyzer = {},
}
for lsp, settings in pairs(servers) do
	print("lsp: " .. lsp .. " settings: " .. vim.inspect(settings))
	local opts = {
		on_attach = on_attach,
		capabilities = capabilities,
	}
	opts = vim.tbl_deep_extend("force", opts, settings)

	print(vim.inspect(opts))
	lspconfig[lsp].setup(opts)
end

--
-- lspconfig.pyright.setup { blabla}
