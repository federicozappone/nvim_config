vim.opt.completeopt = { "menuone", "noselect", "noinsert" }

-- Setup nvim-cmp.
local cmp = require'cmp'
local lspkind = require('lspkind')
local luasnip = require('luasnip')

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },

  formatting = {
    format = lspkind.cmp_format({
      with_text = true
    })
  },

  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete({config= {
      sources={ {name='nvim_lsp'},},
    }}),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping(
      function(fallback)
        -- workaround for https://github.com/hrsh7th/cmp-nvim-lsp-signature-help/issues/13
        if cmp.get_selected_entry() ~= nil and cmp.get_selected_entry().source.name == 'nvim_lsp_signature_help' then
          fallback()
        else
          cmp.mapping.confirm {
            -- behavior = cmp.ConfirmBehavior.Replace,
            -- prova, alcune volte è fastidioso che tolga cose a caso
            behavior = cmp.ConfirmBehavior.Insert,
            select = false,
          }(fallback)
        end
      end), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'luasnip' }, -- For luasnip users.
    { name = 'path' },
  }, {
    { name = 'buffer' },
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

