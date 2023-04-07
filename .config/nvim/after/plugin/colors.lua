require('gruvbox').setup({
    undercurl = true, 
    underline = true,
    bold = true,
    italic = {
        strings = false,
        comments = true,
        operators = false,
        folds = true,
    },
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = false,
    contrast = 'hard',
})

function ColorSettings(color)
    vim.o.background = 'dark'

    -- set colorscheme to gruvbox 
    color = color or 'gruvbox'
    vim.cmd.colorscheme(color)

    -- set background transparent
    vim.api.nvim_set_hl(0, 'Normal', { bg = "none" })
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = "none" })

end

ColorSettings()
