--
--  ▀▀█
--    █     ▄▄▄   ▄▄▄▄    ▄▄▄    ▄▄▄    ▄▄▄▄   ▄▄▄
--    █    █   ▀  █▀ ▀█  █   ▀  ▀   █  █▀ ▀█  ▀   █
--    █     ▀▀▀▄  █   █   ▀▀▀▄  ▄▀▀▀█  █   █  ▄▀▀▀█
--    ▀▄▄  ▀▄▄▄▀  ██▄█▀  ▀▄▄▄▀  ▀▄▄▀█  ▀█▄▀█  ▀▄▄▀█
--                █                     ▄  █
--                ▀                      ▀▀
--  => lua/plugins/lspsaga.lua

local status_ok, lspsaga_config = pcall(require, "lspsaga")
if not status_ok then
  return
end

lspsaga_config.init_lsp_saga {
	error_sign = '',
	warn_sign = '',
	hint_sign = '',
	infor_sign = '',
	border_style = "round",
}
