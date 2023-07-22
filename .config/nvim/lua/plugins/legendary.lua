return {
	'mrjones2014/legendary.nvim',
	-- sqlite is only needed if you want to use frecency sorting
	dependencies = { 'kkharji/sqlite.lua' },
	config = true,
  keys = {
    { '<leader>kl', '<cmd>Legendary<cr>', { desc = "Search shortcuts" } }
  },
	opts = {
		which_key = { auto_register = true },
	},
}
