vim.g.mapleader = ','
vim.g.maplocalleader = ','


-- Clear the search
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- Set working directiory to current directiory of the file.
vim.keymap.set('n', '<leader>.', ':lcd %:p:h<CR>')
