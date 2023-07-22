return {
	'akinsho/nvim-toggleterm.lua',
	keys = {
		{ '<leader>t', '<cmd>ToggleTerm direction=vertical size=100<cr>', desc = 'Create vertical terminal' },
    -- { '<leader>tt', '<cmd>ToggleTermToggleAll<cr>', desc = "Toggle terminals" },
		-- { '<leader>th', '<cmd>ToggleTerm direction=horizontal size=20<cr>', desc = 'Create horizontal terminal' },
	},
	config = function()
		require('toggleterm').setup({})
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
		vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], { noremap = true })
	end,
}
