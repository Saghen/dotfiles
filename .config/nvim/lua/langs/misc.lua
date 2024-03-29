return {
	-- add other languages to treesitter
	{
		'nvim-treesitter/nvim-treesitter',
		opts = function(_, opts)
			if type(opts.ensure_installed) == 'table' then
				---@diagnostic disable-next-line: missing-parameter
				vim.list_extend(opts.ensure_installed, { 'bash', 'css', 'cpp' })
			end
		end,
	},

	-- correctly setup lspconfig
	{
		'neovim/nvim-lspconfig',
		opts = {
			-- Don't format on save
			-- autoformat = false,
			-- make sure mason installs the server
			servers = {
				bashls = {},
				pyright = {},
				eslint = {},
				clangd = {},
			},
		},
	},
}
