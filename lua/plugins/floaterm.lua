--
--    ▄▀▀  ▀▀█                    ▄
--  ▄▄█▄▄    █     ▄▄▄    ▄▄▄   ▄▄█▄▄   ▄▄▄    ▄ ▄▄  ▄▄▄▄▄
--    █      █    █▀ ▀█  ▀   █    █    █▀  █   █▀  ▀ █ █ █
--    █      █    █   █  ▄▀▀▀█    █    █▀▀▀▀   █     █ █ █
--    █      ▀▄▄  ▀█▄█▀  ▀▄▄▀█    ▀▄▄  ▀█▄▄▀   █     █ █ █
--
--  => lua/plugins/floaterm.lua

vim.g.floaterm_title = '-cmd-<$1|$2>'
vim.g.floaterm_wintype = 'float'  -- split, vsplit, float
vim.g.floaterm_position = 'bottom'
vim.g.floaterm_width = 0.95
vim.g.floaterm_height = 0.60
vim.g.floaterm_borderchars = '─│─│┌┐┘└'  -- top, right, bottom, left, topleft, topright, botright, botleft
vim.g.floaterm_autoclose = 0
vim.g.floaterm_autohite = 1
vim.g.floaterm_autoinsert = true


-- other mapping options
-- g:floaterm_keymap_new
-- g:floaterm_keymap_prev
-- g:floaterm_keymap_next
-- g:floaterm_keymap_first
-- g:floaterm_keymap_last
-- g:floaterm_keymap_hide
-- g:floaterm_keymap_show
-- g:floaterm_keymap_kill
-- g:floaterm_keymap_toggle
