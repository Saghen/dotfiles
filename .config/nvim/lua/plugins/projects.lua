return {
	'nvim-telescope/telescope-project.nvim',
	event = 'VeryLazy',
	keys = {
		{ '<leader>fp', "<cmd>lua require('telescope').extensions.project.project({})<cr>", desc = 'Projects' },
	},
	config = function()
		require('telescope').load_extension('project')
	end,
}
