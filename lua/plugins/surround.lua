--
--                                                       █
--   ▄▄▄   ▄   ▄   ▄ ▄▄   ▄ ▄▄   ▄▄▄   ▄   ▄  ▄ ▄▄    ▄▄▄█
--  █   ▀  █   █   █▀  ▀  █▀  ▀ █▀ ▀█  █   █  █▀  █  █▀ ▀█
--   ▀▀▀▄  █   █   █      █     █   █  █   █  █   █  █   █
--  ▀▄▄▄▀  ▀▄▄▀█   █      █     ▀█▄█▀  ▀▄▄▀█  █   █  ▀█▄██
--
--
--  => lua/plugins/surround.lua


local status_ok, surround_config = pcall(require, 'surround')
if not status_ok then
  return
end

surround_config.setup {
  context_offset = 100,
  load_autogroups = false,
  mappings_style = "sandwich",
  load_keymaps = true,  -- use default keymaps (check <plugin folder>/lua/surround/init.lua for groups to change)
  map_insert_mode = true,
  quotes = {"'", '"'},
  brackets = {"(", '{', '['},
  space_on_closing_char = false,
  pairs = {
    nestable = {{"(", ")"}, {"[", "]"}, {"{", "}"}},
    linear = {{"'", "'"}, {"`", "`"}, {'"', '"'}}
  },
  prefix = "z"
}
