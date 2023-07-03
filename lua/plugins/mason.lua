return {
	require("mason").setup(),
	require("mason-lspconfig").setup{
		ensure_installed = { "lua_ls" },
		automatic_installation = true,
	},

	require("lspconfig").lua_ls.setup{
		settings = {
			Lua = {
				diagnostics = {
					globals = {"vim"},
					},
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
					},
				},
			}
		}
}
