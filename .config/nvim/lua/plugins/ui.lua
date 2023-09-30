return {
	{ 'folke/noice.nvim' },
	{
		'rcarriga/nvim-notify',
		keys = {
			{ '<leader>fN', "<cmd>lua require('telescope').extensions.notify.notify()<cr>", desc = 'Notifications' },
		},
		opts = {
			fps = 144,
			stages = 'fade',
			minimum_width = 30,
			render = 'compact',
			top_down = true,
			timeout = 4000,
		},
		config = function(_, opts)
			require('notify').setup(opts)
		end,
	},
	{
		'mawkler/modicator.nvim',
		dependencies = { 'navarasu/onedark.nvim' },
		config = function()
			local c = require('onedark.colors')
			local api = vim.api

			api.nvim_set_hl(0, 'NormalMode', { fg = c.green })
			api.nvim_set_hl(0, 'InsertMode', { fg = c.blue })
			api.nvim_set_hl(0, 'VisualMode', { fg = c.purple })
			api.nvim_set_hl(0, 'ReplaceMode', { fg = c.red })
			api.nvim_set_hl(0, 'CommandMode', { fg = c.yellow })

			require('modicator').setup({
				highlights = {
					defaults = { bold = true },
				},
			})
		end,
	},
	{ 'nvim-treesitter/nvim-treesitter-context', config = true },
	-- {
	-- 	'petertriho/nvim-scrollbar',
	-- 	config = function()
	-- 		local c = require('onedark.colors')
	-- 		return require('scrollbar').setup({
	-- 			handle = {
	-- 				color = c.bg3,
	-- 			},
	-- 		})
	-- 	end,
	-- },
	{
		'goolord/alpha-nvim',
		opts = function()
			local dashboard = require('alpha.themes.dashboard')

			local z_button =
				dashboard.button('z', ' ' .. ' Find folder (z)', [[:lua require('telescope').extensions.zoxide.list() <cr>]])
			z_button.opts.hl = 'AlphaButtons'
			z_button.opts.hl_shortcut = 'AlphaShortcut'
			dashboard.section.buttons.val[1] = z_button

			local project_button = dashboard.button(
				'p',
				' ' .. ' Find project (p)',
				[[:lua require('telescope').extensions.projections.projections({}) <cr>]]
			)
			project_button.opts.hl = 'AlphaButtons'
			project_button.opts.hl_shortcut = 'AlphaShortcut'
			table.insert(dashboard.section.buttons.val, 2, project_button)
		end,
	},
	-- Rainbow for ({[]})
	{
		'HiPhish/rainbow-delimiters.nvim',
		config = function()
			local rainbow_delimiters = require('rainbow-delimiters')
			require('rainbow-delimiters.setup')({
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
			})
		end,
	},
}
