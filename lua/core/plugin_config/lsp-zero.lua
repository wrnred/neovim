-- LSP Configuration

-- COMPLETION
vim.opt.signcolumn = 'yes' -- Reserve space for diagnostic icons

local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.set_preferences({
  set_lsp_keymaps = false
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}
  local bind = vim.keymap.set

   bind('n', '<leader>lk', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
   bind('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
   bind('n', '<leader>ld', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
   bind('n', '<leader>li', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
   bind('n', '<leader>lre', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
   bind('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
   bind('n', '<leader>d', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
   bind('n', '<leader>dn', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
   bind('n', '<leader>dp', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
end)

lsp.setup()
