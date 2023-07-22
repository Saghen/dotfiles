return {
	'rcarriga/nvim-notify',
	keys = {
		{ '<leader>fN', "<cmd>lua require('telescope').extensions.notify.notify()<cr>", desc = 'Notifications' },
	},
	opts = {
		fps = 144,
		stages = 'fade',
		minimum_width = 30,
		render = 'compact',
		top_down = false,
		timeout = 4000,
	},
	config = function(_, opts)
		require('notify').setup(opts)
	end,
}
