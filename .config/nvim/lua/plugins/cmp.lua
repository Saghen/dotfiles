return {
	'hrsh7th/nvim-cmp',
	dependencies = {
		'hrsh7th/cmp-cmdline',
    'onsails/lspkind.nvim',
	},
	opts = function(_, opts)
		local cmp = require('cmp')

		opts.formatting = {
			fields = { 'kind', 'abbr', 'menu' },
			format = function(entry, vim_item)
				local kind = require('lspkind').cmp_format({ mode = 'symbol_text', maxwidth = 50 })(entry, vim_item)
				local strings = vim.split(kind.kind, '%s', { trimempty = true })
				kind.kind = ' ' .. (strings[1] or '') .. ' '
				kind.menu = '    (' .. (strings[2] or '') .. ')'

				return kind
			end,
		}
		opts.mapping = cmp.mapping.preset.insert({
			['<CR>'] = cmp.config.disable,
			['<Tab>'] = cmp.mapping.confirm({ select = true }),
			['<C-Space>'] = cmp.mapping.complete(),
		})
		opts.source = cmp.config.sources({
			{ name = 'nvim_lsp', priority = 10 },
			{ name = 'path', priority = 2 },
			{ name = 'buffer', priority = 1 },
			{ name = 'luasnip', priority = 0 },
		}, {})

    local function deprio(kind)
      return function(e1, e2)
        if e1:get_kind() == kind then
          return false
        end
        if e2:get_kind() == kind then
          return true
        end
      end
    end
		opts.sorting = {
			priority_weight = 1.0,
			comparators = {
        deprio(cmp.lsp.CompletionItemKind.Snippet),
        cmp.config.compare.offset,
        cmp.config.compare.exact,
        cmp.config.compare.score,

        -- copied from cmp-under, but I don't think I need the plugin for this.
        -- I might add some more of my own.
        function(entry1, entry2)
          local _, entry1_under = entry1.completion_item.label:find "^_+"
          local _, entry2_under = entry2.completion_item.label:find "^_+"
          entry1_under = entry1_under or 0
          entry2_under = entry2_under or 0
          if entry1_under > entry2_under then
            return false
          elseif entry1_under < entry2_under then
            return true
          end
        end,

        cmp.config.compare.kind,
        cmp.config.compare.sort_text,
        cmp.config.compare.length,
        cmp.config.compare.order,
        -- deprio(cmp.lsp.CompletionItemKind.Snippet)
      }
		}

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

    return opts
	end,
}
