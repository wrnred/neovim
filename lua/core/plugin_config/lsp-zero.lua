-- LSP Configuration
vim.opt.signcolumn = 'yes' -- Reserve space for diagnostic icons
local lsp = require('lsp-zero')

lsp.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '',
})

lsp.preset({
  float_border = 'rounded',
  call_servers = 'local',
  configure_diagnostics = true,
  setup_servers_on_start = true,
  set_lsp_keymaps = {
    preserve_mappings = false,
    omit = {},
  },
  manage_nvim_cmp = {
    set_sources = 'recommended',
    set_basic_mappings = true,
    set_extra_mappings = false,
    use_luasnip = true,
    set_format = true,
    documentation_window = true,
  },
})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr}) -- add lsp-zero defaults

  local opts = {buffer = bufnr}
  local bind = vim.keymap.set

  -- bind('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {"gopls"},
  handlers = {
    lsp.default_setup,
  },
})
