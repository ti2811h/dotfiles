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
    vim.api.nvim_set_hl(0, 'Normal', {fg = "#7287fd", bg = "#000000" })
    vim.api.nvim_set_hl(0, 'NormalFloat', { fg = "#ab4197", bg = "#000000" })
    vim.api.nvim_set_hl(0, 'EndOfBuffer', { fg = "#7287fd", bg = "#000000" })
    vim.api.nvim_set_hl(0, 'NonText', { fg = "#7287fd", bg = "#000000" })
    vim.api.nvim_set_hl(0, 'NormalNC', { fg = "#ab4197", bg = "#000000" })
    vim.api.nvim_set_hl(0, 'gitsigns', { fg = "#ab4197", bg = "#000000" })
    vim.api.nvim_set_hl(0, 'NvimTreeNormal', { fg='#4c4f69', bg="#000000"})
end

ColorSettings()

