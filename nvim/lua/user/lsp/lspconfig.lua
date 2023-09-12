local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then 
  return
end
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local keymap = vim.keymap

local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }


local on_attach = function(clent, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr}

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

