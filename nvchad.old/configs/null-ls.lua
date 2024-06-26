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

	-- javascript/typescript,
	b.formatting.prettier,
	b.diagnostics.eslint,
}
null_ls.setup({
	debug = true,
	sources = sources,
})
