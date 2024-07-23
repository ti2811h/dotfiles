require("config.lazy")
require("config.catppuccin")
require("config.lsp")
require("config.lualine")
require("config.fugitive")
require("config.gitsigns")
require("config.undotree")
require("config.autopairs")
require("config.nvim-tree")
require("config.telescope")
require("config.markdown")

-- variables
local resize = 2
local tab_size = 4

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- remap leader to space
vim.g.mapleader = ' '

-- Basic vim remaps
vim.keymap.set('n', '<leader>ws', '<cmd>split<cr>')
vim.keymap.set('n', '<leader>wv', '<cmd>vsplit<cr>')
vim.keymap.set('n', '<leader>l', '<C-w>l')
vim.keymap.set('n', '<leader>h', '<C-w>h')
vim.keymap.set('n', '<leader>j', '<C-w>j')
vim.keymap.set('n', '<leader>k', '<C-w>k')
vim.keymap.set('n', '<leader>bv', '<cmd>bprevious<cr>')
vim.keymap.set('n', '<leader>bn', '<cmd>bnext<cr>')
vim.keymap.set('n', '<leader>bd', '<cmd>bdelete<cr>')
vim.keymap.set('n', '<F1>', '<CMD>lua require("FTerm").toggle()<CR>')
-- vim.keymap.set('n', '<leader>wq', '<cmd>wq<cr>')
-- vim.keymap.set('n', '<leader>q', '<cmd>q<cr>')
vim.keymap.set('n', '<Right>', string.format('<cmd>vertical resize +%s<cr>', resize))
vim.keymap.set('n', '<Left>', string.format('<cmd>vertical resize -%s<cr>', resize))
vim.keymap.set('n', '<Up>', string.format('<cmd>res -%s<cr>', resize))
vim.keymap.set('n', '<Down>', string.format('<cmd>res +%s<cr>', resize))

-- set tab
vim.opt.tabstop = tab_size
vim.opt.shiftwidth = tab_size
vim.opt.softtabstop = tab_size
vim.opt.expandtab = true

-- other vim settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.encoding = 'UTF-8'
vim.opt.showmode = false
vim.opt.laststatus = 2
vim.opt.guifont = 'Ubuntu Mono for Powerline'
vim.opt.hidden = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.cmdheight = 2
vim.opt.updatetime = 300

vim.opt.termguicolors = true
-- vim.opt.shortmess+=c
-- vim.opt.signcolumn = 'yes'
vim.keymap.set('n', '<leader>d', '<cmd> DapToggleBreakpoint <CR>') -- DapToggleBreakpoint
vim.keymap.set('n', '<leader>r', '<cmd> DapContinue <CR>') -- Start or continue debugger
