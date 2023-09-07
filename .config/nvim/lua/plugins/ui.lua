return {
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
      local z_button = dashboard.button(
        'z',
        ' ' .. ' Find folder (z)',
        [[:lua require('telescope').extensions.zoxide.list() <cr>]]
      )
      z_button.opts.hl = 'AlphaButtons'
      z_button.opts.hl_shortcut = 'AlphaShortcut'
      dashboard.section.buttons.val[1] = z_button
		end,
	},
}
