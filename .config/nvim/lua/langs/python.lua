return {
	-- add other languages to treesitter
	{
		'nvim-treesitter/nvim-treesitter',
		opts = function(_, opts)
			if type(opts.ensure_installed) == 'table' then
				---@diagnostic disable-next-line: missing-parameter
				vim.list_extend(opts.ensure_installed, { 'python' })
			end
		end,
	},

	-- poetry support
	'karloskar/poetry-nvim',
}
