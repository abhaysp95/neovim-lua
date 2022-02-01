--
--  █                                           ▄
--  █   ▄   ▄▄▄   ▄▄▄▄▄  ▄▄▄▄▄   ▄▄▄   ▄ ▄▄   ▄▄█▄▄   ▄▄▄    ▄ ▄▄  ▄   ▄
--  █ ▄▀   █▀ ▀█  █ █ █  █ █ █  █▀  █  █▀  █    █    ▀   █   █▀  ▀ ▀▄ ▄▀
--  █▀█    █   █  █ █ █  █ █ █  █▀▀▀▀  █   █    █    ▄▀▀▀█   █      █▄█
--  █  ▀▄  ▀█▄█▀  █ █ █  █ █ █  ▀█▄▄▀  █   █    ▀▄▄  ▀▄▄▀█   █      ▀█
--                                                                  ▄▀
--                                                                 ▀▀
--  => lua/plugins/kommentary.lua


local status_ok, kommentary_config = pcall(require, "kommentary.config")
if not status_ok then
  return
end

kommentary_config.configure_language("default", {
    prefer_single_line_comments = false,
    use_consistent_indentation = true,
    ignore_whitespace = true
})

-- kommentary_config.use_extended_mappings()

vim.g.kommentary_create_default_mappings = false  -- change it if you want to use custom bindings

--[[ -- to configure for a language yourself (which is not supported by commentstring)
config.configure_language("rust", {
    single_line_comment_string = "//",
    multi_line_comment_strings = {"/*", "*/"},
})
--]]
