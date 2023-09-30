return {
	'akinsho/nvim-toggleterm.lua',
	keys = {
		{
			'<leader>t',
			function()
				local window_id = vim.api.nvim_get_current_win()
				local term_window_id = vim.g.self_toggleterm_window_id

				-- Terminal doesn't exist so create it
				if term_window_id == nil or term_window_id < 0 then
					vim.cmd('ToggleTerm size=100 direction=vertical')
				-- Terminal exists but it's not focused so focus it
				elseif window_id ~= term_window_id then
					vim.api.nvim_set_current_win(vim.g.self_toggleterm_window_id)
					vim.cmd('startinsert!')
				-- Terminal exists and it's focused so focus last window
				else
					vim.cmd('wincmd p')
				end
			end,
			desc = 'Toggle or focus vertical terminal',
		},
		{
			'<leader>T',
			function()
				vim.cmd('ToggleTerm size=100 direction=vertical')
			end,
			desc = 'Toggle vertical terminal',
		},
	},
	config = function()
		require('toggleterm').setup({
			auto_scroll = false,
			autochdir = true,
			on_open = function(term)
				vim.g.self_toggleterm_window_id = vim.api.nvim_get_current_win()
			end,
			on_close = function(term)
				vim.g.self_toggleterm_window_id = -1
			end,
		})
		local opts = { buffer = 0 }
		vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
		vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
		vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
		vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
		vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
		vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)

		-- We can use <esc><esc> to be able to use a single <esc> in the terminal Vi mode.
		-- vim.api.nvim_buf_set_keymap(0, "t", "<esc><esc>", [[<C-\><C-o>:ToggleTerm<CR>]], { noremap = true })
		-- or we can use a single escape
		-- https://github.com/akinsho/toggleterm.nvim/issues/365
		vim.api.nvim_del_keymap('t', '<esc><esc>') -- default lazyvim bind
		vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], { noremap = true })
	end,
}
