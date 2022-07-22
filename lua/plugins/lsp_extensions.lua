

 ▀▀█                                         ▄                           ▀
   █     ▄▄▄   ▄▄▄▄           ▄▄▄   ▄   ▄  ▄▄█▄▄   ▄▄▄   ▄ ▄▄    ▄▄▄   ▄▄▄    ▄▄▄   ▄ ▄▄    ▄▄▄
   █    █   ▀  █▀ ▀█         █▀  █   █▄█     █    █▀  █  █▀  █  █   ▀    █   █▀ ▀█  █▀  █  █   ▀
   █     ▀▀▀▄  █   █         █▀▀▀▀   ▄█▄     █    █▀▀▀▀  █   █   ▀▀▀▄    █   █   █  █   █   ▀▀▀▄
   ▀▄▄  ▀▄▄▄▀  ██▄█▀         ▀█▄▄▀  ▄▀ ▀▄    ▀▄▄  ▀█▄▄▀  █   █  ▀▄▄▄▀  ▄▄█▄▄ ▀█▄█▀  █   █  ▀▄▄▄▀
               █
               ▀     ▀▀▀▀▀▀

-- => lua/plugins/lsp_extensions.lua


local status_ok, lspe_config = pcall(require, 'lsp_extensions')
if not status_ok then
	return
end

lspe_config.inlay_hints {
	highlight = "Comment",
	prefix = " > ",
	aligned = false,
	only_current_line = false,
	enabled = { "ChainingHint" }
}
