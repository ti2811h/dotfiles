-- TODO first install all plugins
require("ti2811h")

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

-- knap preview settings 
local gknapsettings = {
    texoutputext = "pdf",
    textopdf = "pdflatex -synctex=1 -halt-on-error -interaction=batchmode %docroot%",
    textopdfviewerlaunch = "zathura %outputfile%",
    textopdfviewerrefresh = "kill -HUP %pid%",
    mdoutputext = "pdf",
    mdtopdfviewerlaunch = "zathura %outputfile%",
}
vim.g.knap_settings = gknapsettings

-- set shorter name for keymap function
local kmap = vim.keymap.set

-- F5 processes the document once, and refreshes the view
kmap({ 'n', 'v', 'i' },'<F5>', function() require("knap").process_once() end)

-- F6 closes the viewer application, and allows settings to be reset
kmap({ 'n', 'v', 'i' },'<F6>', function() require("knap").close_viewer() end)

-- F7 toggles the auto-processing on and off
kmap({ 'n', 'v', 'i' },'<F7>', function() require("knap").toggle_autopreviewing() end)

-- F8 invokes a SyncTeX forward search, or similar, where appropriate
kmap({ 'n', 'v', 'i' },'<F8>', function() require("knap").forward_jump() end)
