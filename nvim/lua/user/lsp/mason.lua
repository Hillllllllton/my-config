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
  "java-language-server"
}

local mason = require("mason")

local mason_lspconfig = require("mason-lspconfig")
mason.setup() 

mason_lspconfig.setup {
  ensure_installed = {
    "lua_ls",
    "cssls",
    "html",
    "tsserver",
    "pyright",
    "bashls",
    "jsonls",
    "yamlls",
  },
  automatic_installation = true,
}
