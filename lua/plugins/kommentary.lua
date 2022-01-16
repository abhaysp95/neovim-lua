--
--  █                                           ▄
--  █   ▄   ▄▄▄   ▄▄▄▄▄  ▄▄▄▄▄   ▄▄▄   ▄ ▄▄   ▄▄█▄▄   ▄▄▄    ▄ ▄▄  ▄   ▄
--  █ ▄▀   █▀ ▀█  █ █ █  █ █ █  █▀  █  █▀  █    █    ▀   █   █▀  ▀ ▀▄ ▄▀
--  █▀█    █   █  █ █ █  █ █ █  █▀▀▀▀  █   █    █    ▄▀▀▀█   █      █▄█
--  █  ▀▄  ▀█▄█▀  █ █ █  █ █ █  ▀█▄▄▀  █   █    ▀▄▄  ▀▄▄▀█   █      ▀█
--                                                                  ▄▀
--                                                                 ▀▀
--  => lua/plugins/kommentary.lua

local config = require('kommentary.config')

config.configure_language("default", {
    prefer_single_line_comments = false,
    use_consistent_indentation = true,
    ignore_whitespace = true
})

config.use_extended_mappings()

-- vim.g.kommentary_create_default_mappings = true  -- change it if you want to use custom bindings

--[[ -- to configure for a language yourself (which is not supported by commentstring)
config.configure_language("rust", {
    single_line_comment_string = "//",
    multi_line_comment_strings = {"/*", "*/"},
})
--]]
