return {
	-- add other languages to treesitter
	{
		'nvim-treesitter/nvim-treesitter',
		opts = function(_, opts)
			if type(opts.ensure_installed) == 'table' then
				---@diagnostic disable-next-line: missing-parameter
				vim.list_extend(opts.ensure_installed, { 'bash', 'python', 'css', 'cpp' })
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
				helm_ls = {},
			},
			setup = {
				helm_ls = function(_, opts)
					-- Might not be necessary
					-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/helm_ls.lua

					local configs = require('lspconfig.configs')
					local lspconfig = require('lspconfig')
					local util = require('lspconfig.util')

					if not configs.helm_ls then
						configs.helm_ls = {
							default_config = {
								cmd = { 'helm_ls', 'serve' },
								filetypes = { 'helm' },
								root_dir = function(fname)
									return util.root_pattern('Chart.yaml')(fname)
								end,
							},
						}
					end

					lspconfig.helm_ls.setup({
						filetypes = { 'helm' },
						cmd = { 'helm_ls', 'serve' },
					})
				end,
			},
		},
	},

	-- helm support
	'towolf/vim-helm',

  -- poetry support
  'karloskar/poetry-nvim'
}
