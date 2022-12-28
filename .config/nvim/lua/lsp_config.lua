-- LSP Management
-- DO NOT change the order of these.
require("mason").setup()
require("mason-lspconfig").setup()

-- Actual LSP setups
require("lspconfig").clangd.setup {}	-- C, C++
