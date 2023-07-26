local present, null_ls = pcall(require, "null-ls")

if not present then
	return
end

local b = null_ls.builtins

local sources = {
	-- Lua
	b.formatting.stylua,

	-- cpp
	b.formatting.clang_format,

	-- python
	b.formatting.yapf,
	b.diagnostics.ruff,

	-- rust
	b.formatting.rustfmt,
}
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local on_init = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({
					bufnr = bufnr,
					filter = function(cl)
						return cl.name == "null-ls"
					end,
				})
			end,
		})
	end
end
null_ls.setup({
	debug = true,
	sources = sources,
	on_attach = on_init,
})
