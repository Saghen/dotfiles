return {
	'hrsh7th/nvim-cmp',
	dependencies = {
		'hrsh7th/cmp-cmdline',
	},
	opts = function(_, opts)
		local cmp = require('cmp')
		opts.mapping = cmp.mapping.preset.insert({
			['<CR>'] = cmp.config.disable,
			['<Tab>'] = cmp.mapping.confirm({ select = true }),
			['<C-Space>'] = cmp.mapping.complete(),
		})
		opts.source = cmp.config.sources({
			{ name = 'nvim_lsp' },
			{ name = 'luasnip' }
		}, {})

    cmp.setup(opts)

		cmp.setup.cmdline({ '/', '?' }, {
			mapping = opts.mapping,
			sources = {
				{ name = 'buffer' },
			},
		})

		cmp.setup.cmdline(':', {
			mapping = opts.mapping,
			sources = cmp.config.sources({
				{ name = 'path' },
			}, {
				{ name = 'cmdline' },
			}),
		})
	end,
}
