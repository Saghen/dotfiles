-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.completeopt = 'menu,menuone,preview'
opt.clipboard = 'unnamed'
opt.wrap = false

opt.guifont = 'FuraCode Nerd Font:h10,Symbols Nerd Font Mono:h10'
-- opt.guifont = 'DejaVu Sans Mono:h10'
-- opt.guifont = 'Operator Mono Book:h10'
-- opt.guifont = 'JetBrains Mono:h10'
opt.list = true
opt.listchars:append('space:⋅')
opt.listchars:append('trail:⋅')

local g = vim.g

-- Support for semantic higlighting https://github.com/neovim/neovim/pull/21100
g.lsp_semantic_enabled = 1

if g.neovide then
	g.neovide_scale_factor = 1.0
	g.neovide_refresh_rate = 144
	g.neovide_cursor_trail_size = 0.1
	g.neovide_cursor_animation_length = 0.05
	g.neovide_scroll_animation_length = 0.1
  -- https://github.com/neovide/neovide/issues/1325#issuecomment-1281570219
  -- g.neovide_font_hinting = 'none'
  g.neovide_font_edging = 'subpixelantialias'
	-- Some plugins like whick key look really weird otherwise
	-- Doesn't work though
	-- g.neovide_window_position_animation_length = 0
end
