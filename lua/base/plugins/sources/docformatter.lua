local null_ls = require("null-ls")
local docformatter = {
	name = "docformatter",
	filetypes = { ["py"] = true },
	methods = { [require("null-ls").methods.FORMATTING] = true },
	generator = null_ls.formatter({
		command = "docformatter",
		args = { "--stdin-filename", "$FILENAME", "--black", "-" },
		to_stdin = true,
	}),
	id = 1,
}

return docformatter
