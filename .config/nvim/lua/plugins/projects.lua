return {
	-- {
	-- 	'gnikdroy/projections.nvim',
	-- 	branch = 'pre_release',
	-- 	keys = {
	-- 		{ '<leader>fp', "<cmd>lua require('telescope').extensions.projections.projections({})<cr>", desc = 'Projects' },
	-- 	},
	-- 	config = function()
	-- 		require('projections').setup({
	-- 			workspaces = {
	-- 				'/mnt/storage/code/personal',
	-- 				'/mnt/storage/code/neovim',
	-- 				'/mnt/storage/code/liqwid',
	-- 				'/mnt/storage/code/superfishial/',
	-- 				'/mnt/storage/code/oz/',
	-- 			},
	-- 		})

	-- 		local Session = require('projections.session')

	-- 		-- Autostore session on VimExit
	-- 		vim.api.nvim_create_autocmd({ 'VimLeavePre' }, {
	-- 			callback = function()
	-- 				Session.store(vim.loop.cwd())
	-- 			end,
	-- 		})

	-- 		-- If vim was started with arguments, do nothing
	-- 		-- If in some project's root, attempt to restore that project's session
	-- 		-- If not, restore last session
	-- 		-- If no sessions, do nothing
	-- 		vim.api.nvim_create_autocmd({ 'VimEnter' }, {
	-- 			callback = function()
	-- 				if vim.fn.argc() ~= 0 then
	-- 					return
	-- 				end
	-- 				local session_info = Session.info(vim.loop.cwd())
	-- 				if session_info == nil then
	-- 					Session.restore_latest()
	-- 				else
	-- 					Session.restore(vim.loop.cwd())
	-- 				end
	-- 			end,
	-- 			desc = 'Restore last session automatically',
	-- 		})
	-- 	end,
	-- },
}
-- return {
-- 	'ahmedkhalf/project.nvim',
-- 	dependencies = {
-- 		'nvim-telescope/telescope.nvim',
-- 	},
-- 	keys = {
-- 		{ '<leader>fp', "<cmd>lua require('telescope').extensions.projects.projects({})<cr>", desc = 'Projects' },
-- 	},
-- 	config = function()
-- 		require('project_nvim').setup({})
-- 		require('telescope').load_extension('projects')
-- 	end,
-- }
