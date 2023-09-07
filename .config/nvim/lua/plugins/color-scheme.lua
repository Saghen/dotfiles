return {
	{
		'navarasu/onedark.nvim',
		name = 'onedark',
		lazy = false,
		priority = 1000,
		config = function(_, opts)
			require('onedark').setup(opts)
			require('onedark').load()
		end,
		opts = {
			colors = {
				black = '#131019',
				bg0 = '#1E1E28',
				bg1 = '#2d2939',
				bg2 = '#332E41',
				bg3 = '#393348',
				bg_d = '#1B1923',
			},
			highlights = {
				['@comment'] = { fg = '$blue' },
				['@operator'] = { fg = '$cyan' },
				['@lsp.type.comment'] = { fg = '$blue' },
				['@lsp.type.variable'] = { fg = '$yellow' },
				['@lsp.type.property'] = { fg = '$red' },
				['@lsp.type.generic'] = { fg = '$red' },
			},
		},
	},
	{
		'LazyVim/LazyVim',
		opts = {
			colorscheme = 'onedark',
		},
	},

	-- Rainbow for ({[]})
	{
		'HiPhish/rainbow-delimiters.nvim',
		config = function()
	     local rainbow_delimiters = require('rainbow-delimiters')
			require('rainbow-delimiters.setup') {
				strategy = {
					[''] = rainbow_delimiters.strategy['global'],
					commonlisp = rainbow_delimiters.strategy['local'],
				},
				query = {
					[''] = 'rainbow-delimiters',
					latex = 'rainbow-blocks',
				},
				highlight = {
					'RainbowDelimiterOrange',
					'RainbowDelimiterViolet',
					'RainbowDelimiterBlue',
				},
				blacklist = { 'c', 'cpp' },
			}
		end,
	},
	-- NOTE: Uncomment to enable backgorund highlight instead of underline
	-- {
	-- 	'RRethy/vim-illuminate',
	-- 	dependencies = 'navarasu/onedark.nvim',
	-- 	config = function()
	-- 		vim.api.nvim_set_hl(0, 'IlluminatedWordText', { link = 'Visual' })
	-- 		vim.api.nvim_set_hl(0, 'IlluminatedWordRead', { link = 'Visual' })
	-- 		vim.api.nvim_set_hl(0, 'IlluminatedWordWrite', { link = 'Visual' })
	-- 	end,
	-- },
}
