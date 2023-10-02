local base = require("plugins.configs.lspconfig")
local on_attach = base.on_attach
local capabilities = base.capabilities

local lspconfig = require("lspconfig")

lspconfig.clangd.setup {
  on_attach = function (client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}

-- Vue language options (volar)
lspconfig.volar.setup {
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' }
}

-- rust
lspconfig.rust_analyzer.setup({
  on_attach = on_attach;
  capabilities = capabilities,
  filetypes = {"rust"},
  settings = {
    ['rust-analyzer'] = {
      cargo = { allFeatures = true, }
    }
  }
})

--python
lspconfig.pyright.setup({
  on_attach = on_attach;
  capabilities = capabilities,
  filetypes = {"python"},
})

