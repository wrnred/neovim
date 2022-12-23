-- Treesitter configuration.
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "hcl", "python", "lua", "go", "c", "javascript", "sql", "yaml" },
  auto_install = true,
}
