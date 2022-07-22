
--
--                  ▀                      █
--  ▄ ▄▄   ▄   ▄  ▄▄▄    ▄▄▄▄▄          ▄▄▄█   ▄▄▄   ▄▄▄▄
--  █▀  █  ▀▄ ▄▀    █    █ █ █         █▀ ▀█  ▀   █  █▀ ▀█
--  █   █   █▄█     █    █ █ █   ▀▀▀   █   █  ▄▀▀▀█  █   █
--  █   █    █    ▄▄█▄▄  █ █ █         ▀█▄██  ▀▄▄▀█  ██▄█▀
--                                                   █
--                                                   ▀
-- ==> lua/plugins/nvim-dap.lua

local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
	return
end

local dap_ui_status_ok, dapui = pcall(require, "dapui")
if not dap_ui_status_ok then
	return
end

local dap_install_status_ok, dap_install = pcall(require, "dap-install")
if not dap_install_status_ok then
	return
end

local dap_virtual_text_status_ok, dap_virtual_text = pcall(require, "nvim-dap-virtual-text")
if not dap_virtual_text_status_ok then
	return
end

dap_install.setup {
	installation_path = vim.fn.stdpath "data" .. "/dapinstall/",
}

local dap_breakpoint = {
	error = {
		text = "🟥",
		texthl = "LspDiagnosticsSignError",
		linehl = "",
		numhl = "",
	},
	rejected = {
		text = "",
		texthl = "LspDiagnosticsSignHint",
		linehl = "",
		numhl = "",
	},
	stopped = {
		text = "⭐️",
		texthl = "LspDiagnosticsSignInformation",
		linehl = "DiagnosticUnderlineInfo",
		numhl = "LspDiagnosticsSignInformation",
	},
}

dap_install.config("python", {})

require("config.dap.lua").setup()
require("config.dap.python").setup()
require("config.dap.rust").setup()
require("config.dap.go").setup()
-- add other configs here

dapui.setup {
  sidebar = {
    elements = {
      {
        id = "scopes",
        size = 0.25, -- Can be float or integer > 1
      },
      { id = "breakpoints", size = 0.25 },
    },
    size = 32,
    position = "right", -- Can be "left", "right", "top", "bottom"
  },
  tray = {
    elements = {},
  },
}

vim.fn.sign_define("DapBreakpoint", dap_breakpoint.error)
vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)
-- vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })

dap_virtual_text.setup {
	commented = true,
}

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

