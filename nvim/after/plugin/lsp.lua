local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.set_preferences({
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
})

lsp.setup()
