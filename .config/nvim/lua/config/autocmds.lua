-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local function augroup(name)
	return vim.api.nvim_create_augroup('lazyvim_' .. name, { clear = true })
end

-- disable spelling on buffer read
vim.api.nvim_create_autocmd('BufReadPost', {
	group = augroup('no_spell'),
	callback = function()
		vim.opt_local.spell = false
	end,
})

vim.cmd([[autocmd BufRead,BufNewFile ~/.config/waybar/config set syntax=jsonc]])
vim.cmd([[autocmd BufRead,BufNewFile *.rasi set syntax=css]])

-- Don't show completions when typing space
vim.api.nvim_create_autocmd({ 'TextChangedI' }, {
	pattern = { '*' },
	callback = function()
		local cmp_config = require('cmp.config')
		-- vim.v_char is the last character that was typed
		if vim.v.char == ' ' then
			cmp_config.global.completion.autocomplete = {}
		else
			cmp_config.global.completion.autocomplete = { 'TextChanged' }
		end
	end,
})

-- disable null-ls on helm files
-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local filetype = vim.bo[ev.buf].filetype
		if filetype == 'helm' then
			local active_clients = vim.lsp.get_active_clients()
			for _, client in pairs(active_clients) do
				if client.name == 'null-ls' then
					-- vim.lsp.stop_client(client.id, true)
					vim.lsp.buf_detach_client(ev.buf, client.id)
					vim.diagnostic.disable(ev.buf)
					vim.defer_fn(function()
						vim.diagnostic.reset(nil, ev.buf)
					end, 1000)
					-- vim.cmd('LspStop null-ls')
				end
			end
		end
	end,
})
