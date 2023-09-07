return {
	'nvim-neo-tree/neo-tree.nvim',
	keys = {
		{ '<leader>e', false },
		{ '<leader>E', false },
		{ '<leader>E', '<cmd>Neotree toggle<cr>', desc = 'Toggle NeoTree' },
		{
			'<leader>e',
			function()
				local is_neotree_focused = function()
					-- Get our current buffer number
					local bufnr = vim.api.nvim_get_current_buf and vim.api.nvim_get_current_buf() or vim.fn.bufnr()
					-- Get all the available sources in neo-tree
					for _, source in ipairs(require('neo-tree').config.sources) do
						-- Get each sources state
						local state = require('neo-tree.sources.manager').get_state(source)
						-- Check if the source has a state, if the state has a buffer and if the buffer is our current buffer
						if state and state.bufnr and state.bufnr == bufnr then
							return true
						end
					end
					return false
				end

				if is_neotree_focused() then
					vim.api.nvim_command('wincmd p')
				else
					vim.api.nvim_command('Neotree focus')
				end
			end,
			desc = 'Toggle NeoTree focus',
		},
	},
	opts = {
		sort_case_insensitive = true,
		filesystem = {
			filtered_items = {
				hide_dotfiles = false,
				hide_gitignored = true,
				hide_by_name = {
					'.git',
					'node_modules',
				},
				never_show = {
					'.git',
					'.DS_Store',
					'__pycache__',
					'.pytest_cache',
					'.classpath',
					'.project',
					'.settings',
					'.factorypath',
				},
				never_show_by_pattern = {
					'sublime-*',
				},
			},
			window = {
				mappings = {
					['o'] = 'system_open',
					['f'] = 'fuzzy_finder',
					['F'] = 'filter_on_submit',
				},
			},
			commands = {
				system_open = function(state)
					local node = state.tree:get_node()
					local path = node:get_id()
					-- macOs: open file in default application in the background.
					-- Probably you need to adapt the Linux recipe for manage path with spaces. I don't have a mac to try.
					vim.api.nvim_command('silent !open -g ' .. path)
					-- Linux: open file in default application
					vim.api.nvim_command(string.format("silent !xdg-open '%s'", path))
				end,
				-- Override delete to use trash instead of rm
				delete = function(state)
					local path = state.tree:get_node().path
					vim.fn.system({ 'trash', vim.fn.fnameescape(path) })
					require('neo-tree.sources.manager').refresh(state.name)
				end,
				-- over write default 'delete_visual' command to 'trash' x n.
				delete_visual = function(state, selected_nodes)
					local inputs = require('neo-tree.ui.inputs')

					-- get table items count
					function GetTableLen(tbl)
						local len = 0
						for n in pairs(tbl) do
							len = len + 1
						end
						return len
					end

					local count = GetTableLen(selected_nodes)
					local msg = 'Are you sure you want to trash ' .. count .. ' files ?'
					inputs.confirm(msg, function(confirmed)
						if not confirmed then
							return
						end
						for _, node in ipairs(selected_nodes) do
							vim.fn.system({ 'trash', vim.fn.fnameescape(node.path) })
						end
						require('neo-tree.sources.manager').refresh(state.name)
					end)
				end,
			},
			event_handlers = {
				{
					event = 'file_opened',
					handler = function(state)
						require('neo-tree.sources.filesystem').reset_search(state)
					end,
				},
			},
			bind_to_cwd = true,
			follow_current_file = true,
		},
		window = {
			mappings = {
				-- Hide git ignored
				['G'] = function(state)
					state.filtered_items.visible = false
					state.filtered_items.hide_gitignored = not state.filtered_items.hide_gitignored
					require('neo-tree.sources.manager').refresh('filesystem')
				end,
				-- Hide dotfiles
				['H'] = function(state)
					state.filtered_items.visible = false
					state.filtered_items.hide_dotfiles = not state.filtered_items.hide_dotfiles
					require('neo-tree.sources.manager').refresh('filesystem')
				end,
			},
		},
	},
}
