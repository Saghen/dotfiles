-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require('lazyvim.util')

local function map(mode, lhs, rhs, opts)
	local keys = require('lazy.core.handler').handlers.keys
	---@cast keys LazyKeysHandler
	-- do not create the keymap if a lazy keys handler exists
	if not keys.active[keys.parse({ lhs, mode = mode }).id] then
		opts = opts or { noremap = true }
		opts.silent = opts.silent ~= false
		vim.keymap.set(mode, lhs, rhs, opts)
	end
end

-- ease of use binds
-- map('n', ';', ':', { desc = 'Command' })
-- map('n', '<C-w>', 'daw', { desc = 'Delete word' })
map('n', '<leader>h', '<cmd>noh<cr>', { desc = 'Remove highlight' })
map('n', '<leader>qQ', '<cmd>qa!<cr>', { desc = 'Force quit all' })

-- extra options
map('n', '<leader>ul', '<cmd>Gitsigns toggle_current_line_blame<cr>', { desc = 'Toggle current line blame' })

-- save file
map('n', '<leader>fs', '<cmd>w<cr>', { desc = 'Write file' })
map('n', '<leader>fS', '<cmd>SudoWrite<cr>', { desc = 'Write file with sudo' })
map('v', '<leader>fs', '<cmd>w<cr>', { desc = 'Write file' })
map('v', '<leader>fS', '<cmd>SudoWrite<cr>', { desc = 'Write file with sudo' })

-- clipboard
map('v', '<leader>y', '"+y', { desc = 'Yank to system clipboard' })
map('v', '<leader>p', '"+p', { desc = 'Paste from system clipboard' })
map('n', '<leader>p', '"+p', { desc = 'Paste from system clipboard' })
map('n', '<leader>P', '<cmd>!pst %<CR>', { desc = 'Upload buffer to paste bin' })

-- extra spectre binds
map('n', '<leader>sp', "<cmd>lua require('spectre').open_file_search()<cr>")
map('n', '<leader>sP', "<cmd>lua require('spectre').open_file_search({select_word=true})<cr>")

-- key prefix
local wk = require('which-key')
wk.register({
	k = {
		name = 'keybinds',
	},
}, { prefix = '<leader>' })
map('n', '<leader>kw', "<cmd>WhichKey<cr>", { desc = "Open Which Key" })

-- neovide
if vim.g.neovide then
	-- map('i', '<C-V>', '<C-o>"+p', { desc = 'Paste from system clipboard' })
	map('i', '<C-v>', '<C-o>P', { desc = 'Paste' })
end
