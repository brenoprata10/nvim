local lsp = require "lspconfig"
local attach_common = require("attach-common")
local client_capabilities = vim.lsp.protocol.make_client_capabilities()
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities(client_capabilities)
local lint_config = {
	validate = true,
	lint = {
		compatibleVendorPrefixes = "ignore",
		vendorPrefix = "warning",
		duplicateProperties = "warning",
		emptyRules = "warning",
		importStatement = "warning",
		boxModel = "warning",
		universalSelector = "warning",
		zeroUnits = "warning",
		fontFaceProperties = "warning",
		hexColorLength = "warning",
		argumentsInColorFunction = "error",
		unknownProperties = "warning",
	},
}

lsp.cssls.setup({
	capabilities = lsp_capabilities,
	on_attach = function(client, bufnr)
		attach_common.setup(client, bufnr)
	end,
	settings = {
		css = lint_config,
		scss = lint_config,
		less = lint_config,
	},
})
