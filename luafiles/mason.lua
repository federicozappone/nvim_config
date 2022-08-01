require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = { "sumneko_lua", "clangd", "pylsp", "ltex", "dockerls", "bashls" },
  automatic_installation = true
})
