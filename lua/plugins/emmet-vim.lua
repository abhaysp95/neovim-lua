--
--                                ▄                    ▀
--   ▄▄▄   ▄▄▄▄▄  ▄▄▄▄▄   ▄▄▄   ▄▄█▄▄         ▄   ▄  ▄▄▄    ▄▄▄▄▄
--  █▀  █  █ █ █  █ █ █  █▀  █    █           ▀▄ ▄▀    █    █ █ █
--  █▀▀▀▀  █ █ █  █ █ █  █▀▀▀▀    █     ▀▀▀    █▄█     █    █ █ █
--  ▀█▄▄▀  █ █ █  █ █ █  ▀█▄▄▀    ▀▄▄           █    ▄▄█▄▄  █ █ █
--
--  => lua/plugins/emmet-vim.lua
--


vim.g.user_emmet_mode = 'a'  -- a, inv, n

vim.g.user_emmet_install_global = 0
vim.cmd [[ autocmd FileType html, css, markdown EmmetInstall ]]

vim.g.user_emmet_leader_key='<C-Y>'

-- add custom snippet
-- vim.g.user_emmet_settings = [[ webapi#json#decode(join(readfile(expand('~/.snippets_custom.json')), "\n")) ]]
