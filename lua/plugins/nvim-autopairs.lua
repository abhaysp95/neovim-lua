--
--                  ▀                                  ▄                          ▀
--  ▄ ▄▄   ▄   ▄  ▄▄▄    ▄▄▄▄▄          ▄▄▄   ▄   ▄  ▄▄█▄▄   ▄▄▄   ▄▄▄▄    ▄▄▄  ▄▄▄     ▄ ▄▄   ▄▄▄
--  █▀  █  ▀▄ ▄▀    █    █ █ █         ▀   █  █   █    █    █▀ ▀█  █▀ ▀█  ▀   █   █     █▀  ▀ █   ▀
--  █   █   █▄█     █    █ █ █   ▀▀▀   ▄▀▀▀█  █   █    █    █   █  █   █  ▄▀▀▀█   █     █      ▀▀▀▄
--  █   █    █    ▄▄█▄▄  █ █ █         ▀▄▄▀█  ▀▄▄▀█    ▀▄▄  ▀█▄█▀  ██▄█▀  ▀▄▄▀█ ▄▄█▄▄   █     ▀▄▄▄▀
--                                                                 █
--                                                                 ▀
--  => lua/plugins/nvim-autopairs.lua


local status_ok, autopairs_config = pcall(require, "nvim-autopairs")
if not status_ok then
  return
end


autopairs_config.setup({
	check_ts = true,  -- treesitter integration
	enable_check_bracket_line = false,
	disable_filetype = { "TelescopePrompt" },
})


-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))


-- add a lisp filetype (wrap my-function), FYI: Hardcoded = { "clojure", "clojurescript", "fennel", "janet" }
-- cmp_autopairs.lisp[#cmp_autopairs.lisp+1] = "racket"
