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
	emmet_ls = { filetypes = { "html", "css" } },
	html = {},
	tailwindcss = {},
	hls = {},
}

local inlay_hints_on_attach = function(client, bufnr)
	on_attach(client, bufnr)
	if client.server_capabilities.documentSymbolProvider then
		require("nvim-navic").attach(client, bufnr)
	end
end
for lsp, settings in pairs(servers) do
	local opts = {
		-- on_init = on_init,
		on_attach = inlay_hints_on_attach,
		capabilities = capabilities,
	}
	opts = vim.tbl_deep_extend("force", opts, settings)
	lspconfig[lsp].setup(opts)
end

--
-- lspconfig.pyright.setup { blabla}
