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

require('catppuccin').setup({
    flavor = "mocha",
    show_end_of_buffer = true,
    styles = {
        comments = { "italic" },
        conditionals = {},
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = false,
        mini = false,
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
})

function ColorSettings(color)
    vim.o.background = 'dark'

    -- set colorscheme to gruvbox 
    color = color or 'catppuccin'
    vim.cmd.colorscheme(color)

    -- set background transparent
    vim.api.nvim_set_hl(0, 'Normal', {fg = "#ab4197", bg = "#111022" })
    vim.api.nvim_set_hl(0, 'NormalFloat', { fg = "#ab4197", bg = "#111022" })
    vim.api.nvim_set_hl(0, 'EndOfBuffer', { fg = "#ab4197", bg = "#111022" })
    vim.api.nvim_set_hl(0, 'NonText', { fg = "#ab4197", bg = "#111022" })
    vim.api.nvim_set_hl(0, 'NormalNC', { fg = "#ab4197", bg = "#111022" })
    vim.api.nvim_set_hl(0, 'gitsigns', { fg = "#ab4197", bg = "#111022" })

end

ColorSettings()

