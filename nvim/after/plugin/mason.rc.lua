local status, mason = pcall(require, 'mason')
if not status then return end
local config_status, mason_lsp_congig = pcall(require, 'mason-lspconfig')
if not config_status then return end

mason.setup({})

mason_lsp_congig.setup({
  ensure_installed = { "sumneko_lua", "tailwindcss" },
})
