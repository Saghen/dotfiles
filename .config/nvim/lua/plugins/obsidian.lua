local wk = require('which-key')
wk.register({
	o = {
		name = 'obsidian',
	},
}, { prefix = '<leader>' })

return {
	{
		'epwalsh/obsidian.nvim',
		keys = {
			{ '<leader>oo', '<cmd>ObsidianOpen<cr>' },
			{ '<leader>on', '<cmd>ObsidianNew<cr>' },
			{ '<leader>oT', '<cmd>ObsidianTemplate<cr>' },
			{ '<leader>ot', '<cmd>ObsidianToday<cr>' },
			{ '<leader>oy', '<cmd>ObsidianYesterday<cr>' },
			{ '<leader>ol', '<cmd>ObsidianLink<cr>' },
			{ '<leader>oL', '<cmd>ObsidianLinkNew<cr>' },
			{ '<leader>ob', '<cmd>ObsidianBacklinks<cr>' },
			{ '<leader>os', '<cmd>ObsidianSearch<cr>' },
			{ '<leader>oq', '<cmd>ObsidianQuickSwitch<cr>' },
		},
		dependencies = {
			'folke/which-key.nvim',
		},
		opts = {
			dir = '~/Documents/notes',
			completion = {
				nvim_cmp = true,
			},
		},
		config = function(_, opts)
			require('obsidian').setup(opts)

			vim.keymap.set('n', 'gf', function()
				if require('obsidian').util.cursor_on_markdown_link() then
					return '<cmd>ObsidianFollowLink<CR>'
				else
					return 'gf'
				end
			end, { noremap = false, expr = true })
		end,
	},
	{},
}