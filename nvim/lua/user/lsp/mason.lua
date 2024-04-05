local servers = {
	"lua_ls",
	"cssls",
	"html",
	"tsserver",
	"pyright",
	"bashls",
	"jsonls",
	"yamlls",
	"clangd",
	"java-language-server",
}

local mason = require("mason")

local mason_lspconfig = require("mason-lspconfig")
mason.setup()

mason_lspconfig.setup({
	ensure_installed = {
		"lua_ls",
		"cssls",
		"html",
		"tsserver",
		"pyright",
		"bashls",
		"jsonls",
		"yamlls",
		"gopls",
		"terraformls",
	},
	automatic_installation = true,
})

local mason_tool_installer = require("mason-tool-installer")

mason_tool_installer.setup({
	ensure_installed = {
		"prettier", -- prettier formatter
		"stylua", -- lua formatter
		-- "isort", -- python formatter
		-- "black", -- python formatter
		-- "pylint",
		"eslint_d",
		"tflint",
	},
})
