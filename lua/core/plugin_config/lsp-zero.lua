-- LSP Configuration

-- COMPLETION
-- Default keybindings
--    <Enter>: Confirms selection.
--    <Ctrl-y>: Confirms selection.
--    <Up>: Navigate to previous item on the list.
--    <Down>: Navigate to the next item on the list.
--    <Ctrl-p>: Navigate to previous item on the list.
--    <Ctrl-n>: Navigate to the next item on the list.
--    <Ctrl-u>: Scroll up in the item's documentation.
--    <Ctrl-f>: Scroll down in the item's documentation.
--    <Ctrl-e>: Toggles the completion.
--    <Ctrl-d>: Go to the next placeholder in the snippet.
--    <Ctrl-b>: Go to the previous placeholder in the snippet.
--    <Tab>: Enables completion when the cursor is inside a word. If the completion menu is visible it will navigate to the next item in the list.
--    <S-Tab>: When the completion menu is visible navigate to the previous item in the list.
--
-- LSP
-- Default keybindings
--  K: Displays hover information about the symbol under the cursor in a floating window. See :help vim.lsp.buf.hover().
--  gd: Jumps to the definition of the symbol under the cursor. See :help vim.lsp.buf.definition().
--  gD: Jumps to the declaration of the symbol under the cursor. Some servers don't implement this feature. See :help vim.lsp.buf.declaration().
--  gi: Lists all the implementations for the symbol under the cursor in the quickfix window. See :help vim.lsp.buf.implementation().
--  go: Jumps to the definition of the type of the symbol under the cursor. See :help vim.lsp.buf.type_definition().
--  gr: Lists all the references to the symbol under the cursor in the quickfix window. See :help vim.lsp.buf.references().
--  <Ctrl-k>: Displays signature information about the symbol under the cursor in a floating window.
  --  See :help vim.lsp.buf.signature_help(). If a mapping already exists for this key this function is not bound.
--  <F2>: Renames all references to the symbol under the cursor. See :help vim.lsp.buf.rename().
--  <F4>: Selects a code action available at the current cursor position. See :help vim.lsp.buf.code_action().


vim.opt.signcolumn = 'yes' -- Reserve space for diagnostic icons

local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.ensure_installed({
  'eslint',
  'sumneko_lua',
})

lsp.nvim_workspace()

lsp.setup()
