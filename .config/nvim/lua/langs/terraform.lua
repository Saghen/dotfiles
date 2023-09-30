vim.filetype.add({
	extension = {
		tf = 'terraform',
	},
})
return {
	{
		'nvim-treesitter/nvim-treesitter',
		opts = function(_, opts)
			if type(opts.ensure_installed) == 'table' then
				vim.list_extend(opts.ensure_installed, {
					'terraform',
					'hcl',
				})
			end
		end,
	},
	{
		'neovim/nvim-lspconfig',
		opts = {
			servers = {
				terraformls = {},
				tflint = {},
			},
		},
	},
	{
		'nvimtools/none-ls.nvim',
		opts = function(_, opts)
			if type(opts.sources) == 'table' then
				local none_ls = require('none-ls')
				vim.list_extend(opts.sources, {
					none_ls.builtins.formatting.terraform_fmt,
					none_ls.builtins.diagnostics.terraform_validate,
				})
			end
		end,
	},
}
