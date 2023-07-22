return {
	{ 'nvim-treesitter/nvim-treesitter-context', config = true },
	{
		'petertriho/nvim-scrollbar',
		config = function()
			local c = require('onedark.colors')
			return require('scrollbar').setup({
				handle = {
					color = c.bg3,
				},
			})
		end,
	},
}
