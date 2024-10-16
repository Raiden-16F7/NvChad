-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- Define the servers you want to use
local servers = {
  "html",
  "cssls",
  "vtsls",             -- Vetur (Vue) LSP, replace with tsserver if focused on JS/TS
  "tailwindcss",
  "lua_ls",
  "emmet_language_server",
  "ts_ls",          -- Add tsserver for TypeScript/JavaScript
}

local nvlsp = require "nvchad.configs.lspconfig"

-- Custom on_attach function for tsserver
local on_attach = function(client, bufnr)
  nvlsp.on_attach(client, bufnr)

  -- Disable tsserver formatting, use Prettier instead
  if client.name == "ts_ls" then
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end
end

-- Loop over and setup LSP servers
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- Setup ESLint separately for linting
lspconfig.eslint.setup {
  on_attach = function(client, bufnr)
    -- Enable ESLint diagnostics and formatting
    client.server_capabilities.documentFormattingProvider = true
    nvlsp.on_attach(client, bufnr)
  end,
  settings = {
    -- Can adjust ESLint settings here if needed
  },
}
