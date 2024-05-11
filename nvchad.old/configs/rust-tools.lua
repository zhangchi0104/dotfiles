local rt = require("rust-tools")
local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
rt.setup({
	server = {
		on_attach = function(client, bufnr)
			-- format on save
			if client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format({ bufnr = bufnr })
					end,
				})
				on_attach(client, bufnr)
			end
			-- Hover actions
			vim.keymap.set("n", "<leader>lr", require("nvchad_ui.renamer").open, { buffer = bufnr })
			vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, { buffer = bufnr })
		end,
		capabilities = capabilities,
	},
})
