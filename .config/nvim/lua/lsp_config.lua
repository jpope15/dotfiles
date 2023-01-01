-- LSP Management
-- DO NOT change the order of these.
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {"clangd"},
    automatic_installation = true,
})

require("mason-lspconfig").setup_handlers({
    function (server_name)
        require("lspconfig")[server_name].setup {}
    end
})
