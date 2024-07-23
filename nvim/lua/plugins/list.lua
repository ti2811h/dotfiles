return {
    -- catppuccin colorscheme
    {
        "catppuccin/nvim",
        lazy = false,
        as = "catppuccin",
        priority = 1000,
    },

    -- autopairs
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true,
        opts = {
            disable_filetype = { "TelescopePrompt" , "vim" },
        },
    },
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

    -- telescope (fuzzy finder)
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        -- or                              , branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    -- Mason for managing LSP servers
    { 'williamboman/mason.nvim' },
    {'williamboman/mason-lspconfig.nvim'},
    -- LSP Configurations
    { "neovim/nvim-lspconfig" },
    -- Autocompletion
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },
    { 'L3MON4D3/LuaSnip' },
    -- Treesitter
    { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },

    -- nvim-tree 
    {'nvim-tree/nvim-tree.lua'},
    {'nvim-tree/nvim-web-devicons'},

    -- undotree
    {'mbbill/undotree'},

    -- git
    {'tpope/vim-fugitive'},
    {'lewis6991/gitsigns.nvim'},

    -- lualine
    {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    },

    -- floating term 
    { "numToStr/FTerm.nvim" },

    -- debugger
    { "mfussenegger/nvim-dap" },
    {
        "jay-babu/mason-nvim-dap.nvim",
        event = "VeryLazy",
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap"
        },
        opts = {
            handlers = {},
        },
    },
    {
        "rcarriga/nvim-dap-ui",
        event = "VeryLazy",
        dependencies = { "mfussenegger/nvim-dap" },
        config = function ()
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = function ()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function ()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function ()
                dapui.close()
            end
        end
    },
    { "nvim-neotest/nvim-nio" },

    -- markdown
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && yarn install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },
    {"dhruvasagar/vim-table-mode"},
    {"frabjous/knap"},

    -- obsidian
    {
        "epwalsh/obsidian.nvim",
        version = "*",  -- recommended, use latest release instead of latest commit
        lazy = true,
        ft = "markdown",
        -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
        -- event = {
        --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
        --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
        --   "BufReadPre path/to/my-vault/**.md",
        --   "BufNewFile path/to/my-vault/**.md",
        -- },
        dependencies = {
        -- Required.
        "nvim-lua/plenary.nvim",

        -- see below for full list of optional dependencies 👇
        },
        opts = {
            workspaces = {
            {
                name = "EinsLolVault",
                path = "~/Documents/Notes/obsidian/EinsLolVault",
            },
            },

        -- see below for full list of options 👇
        },
    },
}
