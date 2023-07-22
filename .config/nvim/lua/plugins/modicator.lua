return {
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
}
