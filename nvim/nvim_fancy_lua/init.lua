-- disable netrw
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

require('options')
require('keymaps')
require('colorscheme')
require('plugins')

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
require("nvim-tree").setup()
