local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	return
end
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local keymap = vim.keymap

local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }

local whichkey = require("which-key")
local opts = { buffer = bufnr }
whichkey.register({
	d = {
		name = "diagnostics",
		d = { "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", "show line diagnostics" },
		l = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", "set loclist" },
		n = { "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "goto next" },
		p = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", "goto prev" },
		q = { "<cmd>lua vim.lsp.diagnostic.set_qflist()<CR>", "set qflist" },
		w = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", "set loclist" },
	},
	l = {
		name = "lsp",
		a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "code action" },
		d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "definition" },
		D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "declaration" },
		f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "formatting" },
		h = { "<cmd>lua vim.lsp.buf.hover()<CR>", "hover" },
		i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "implementation" },
		k = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "signature help" },
		l = { "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", "show line diagnostics" },
		n = { "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "goto next" },
		p = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", "goto prev" },
		q = { "<cmd>lua vim.lsp.diagnostic.set_qflist()<CR>", "set qflist" },
		r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "rename" },
		s = { "<cmd>lua vim.lsp.buf.document_symbol()<CR>", "document symbol" },
		S = { "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", "workspace symbol" },
		t = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "type definition" },
	},
}, { prefix = "<leader>" })

local on_attach = function(clent, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }

	keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	keymap.set("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	keymap.set("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	keymap.set("n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	keymap.set("n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
	keymap.set("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
	keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
	keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
end

lspconfig["cssls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
lspconfig["html"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
lspconfig["tsserver"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
lspconfig["pyright"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
lspconfig["bashls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
lspconfig["jsonls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
lspconfig["yamlls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
lspconfig["gopls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
local tf_capb = vim.lsp.protocol.make_client_capabilities()
tf_capb.textDocument.completion.completionItem.snippetSupport = true
lspconfig["terraformls"].setup({
	capabilities = tf_capb,
	on_attach = on_attach,
	filetypes = { "terraform", "terraform-vars", "tf" },
	flags = { debounce_text_changes = 150 },
})

-- lspconfig["clang"].setup({
--   capabilities = capabilities,
--   on_attach = on_attach,
-- })
