-- Default configurations for nvim.

-- Colors and feel.
vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = false
vim.opt.autoread = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.clipboard = "unnamedplus"

vim.cmd('colorscheme rose-pine')
vim.o.background = "dark"
vim.cmd('set relativenumber')

-- Provider Configuration.
vim.g.python3_host_prog = '~/.config/nvim/venv/bin/python3'
