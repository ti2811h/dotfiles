-- Mason setup
require('mason').setup()
require('mason-lspconfig').setup {
  ensure_installed = {
    'pyright',
    'ts_ls',
    'lua_ls',
    'clangd',
  },
}

-- Key mappings for LSP (attached when any LSP connects)
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local bufnr = args.buf
    local opts = { noremap = true, silent = true, buffer = bufnr }

    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format({ async = true })
    end, opts)
  end,
})

-- Configure LSP servers with the new API
vim.lsp.config('pyright', {})
vim.lsp.config('ts_ls', {})
vim.lsp.config('clangd', {})
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },  -- stop lua_ls complaining about 'vim' being undefined
      },
    },
  },
})


vim.lsp.config["tinymist"] = {
    cmd = { "tinymist" },
    filetypes = { "typst" },
    settings = {
        exportPdf = "onSave",
    }
}



vim.lsp.enable({ 'pyright', 'ts_ls', 'lua_ls', 'clangd' })

-- Treesitter
require('nvim-treesitter.configs').setup {
  ensure_installed = { "lua", "c", "cpp", "rust", "java" },
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
}

-- nvim-cmp
local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif require('luasnip').expand_or_jumpable() then
        require('luasnip').expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif require('luasnip').jumpable(-1) then
        require('luasnip').jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
  }),
})

cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' },
  },
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' },
  }, {
    { name = 'cmdline' },
  }),
})
