return {
	-- {
	-- 	'NeogitOrg/neogit',
	-- 	dependencies = {
	-- 		'nvim-lua/plenary.nvim', -- required
	-- 		'nvim-telescope/telescope.nvim', -- optional
	-- 		'sindrets/diffview.nvim', -- optional
	-- 		'ibhagwan/fzf-lua', -- optional
	-- 	},
	-- 	config = true,
	-- },
	{
		'lewis6991/gitsigns.nvim',
		config = true,
		opts = {
			current_line_blame = true,
			current_line_blame_opts = {
				delay = 500,
			},
			yadm = {
				enable = true,
			},
		},
	},
	-- {
	-- 	-- 'topaxi/gh-actions.nvim',
	-- 	dir = '/mnt/storage/code/neovim/gh-actions.nvim/',
	-- 	cmd = 'GhActions',
	-- 	keys = {
	-- 		{ '<leader>ga', '<cmd>GhActions<cr>', desc = 'Open Github Actions' },
	-- 	},
	-- 	-- optional, you can also install and use `yq` instead.
	-- 	build = 'make',
	-- 	dependencies = { 'nvim-lua/plenary.nvim', 'MunifTanjim/nui.nvim' },
	-- 	opts = {},
	-- 	config = function(_, opts)
	-- 		require('gh-actions').setup(opts)
	-- 	end,
	-- },
	-- 	{
	-- 		'pwntester/octo.nvim',
	-- 		event = 'VeryLazy',
	-- 		dependencies = {
	-- 			'nvim-lua/plenary.nvim',
	-- 			'nvim-telescope/telescope.nvim',
	-- 			'nvim-tree/nvim-web-devicons',
	-- 		},
	-- 		opts = {},
	-- 	},
}
