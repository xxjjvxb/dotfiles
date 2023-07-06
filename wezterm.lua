local wezterm = require("wezterm")

local config = {
    check_for_updates = false,
    color_scheme = "Galaxy",
    inactive_pane_hsb = {
        hue = 1.0,
        saturation = 1.0,
        brightness = 1.0,
    },
    font_size = 12.0,
    launch_menu = {},
    leader = { key="a", mods="CTRL", timeout_milliseconds = 10000 },
    disable_default_key_bindings = true,
    scrollback_lines = 3500,
    enable_scroll_bar = true,
    keys = {
        -- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
        { key="a", mods = "LEADER|CTRL",  action=wezterm.action{SendString="\x01"}},
        { key="=", mods = "LEADER",       action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
        { key="\"",mods = "LEADER|SHIFT",  action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
        { key="z", mods = "LEADER",       action="TogglePaneZoomState" },
        { key="c", mods = "LEADER",       action=wezterm.action{SpawnTab="CurrentPaneDomain"}},
        { key="h", mods = "LEADER",       action=wezterm.action{ActivatePaneDirection="Left"}},
        { key="j", mods = "LEADER",       action=wezterm.action{ActivatePaneDirection="Down"}},
        { key="k", mods = "LEADER",       action=wezterm.action{ActivatePaneDirection="Up"}},
        { key="l", mods = "LEADER",       action=wezterm.action{ActivatePaneDirection="Right"}},
        { key="H", mods = "LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Left", 5}}},
        { key="J", mods = "LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Down", 5}}},
        { key="K", mods = "LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Up", 5}}},
        { key="L", mods = "LEADER|SHIFT", action=wezterm.action{AdjustPaneSize={"Right", 5}}},
        { key="1", mods = "LEADER",       action=wezterm.action{ActivateTab=0}},
        { key="2", mods = "LEADER",       action=wezterm.action{ActivateTab=1}},
        { key="3", mods = "LEADER",       action=wezterm.action{ActivateTab=2}},
        { key="4", mods = "LEADER",       action=wezterm.action{ActivateTab=3}},
        { key="5", mods = "LEADER",       action=wezterm.action{ActivateTab=4}},
        { key="6", mods = "LEADER",       action=wezterm.action{ActivateTab=5}},
        { key="7", mods = "LEADER",       action=wezterm.action{ActivateTab=6}},
        { key="8", mods = "LEADER",       action=wezterm.action{ActivateTab=7}},
        { key="9", mods = "LEADER",       action=wezterm.action{ActivateTab=8}},
        { key="&", mods = "LEADER|SHIFT", action=wezterm.action{CloseCurrentTab={confirm=true}}},
        { key="x", mods = "LEADER",       action=wezterm.action{CloseCurrentPane={confirm=true}}},

        { key = "n", mods="SHIFT|CTRL",     action="ToggleFullScreen" },
        { key="v",   mods="SHIFT|CTRL",     action=wezterm.action.PasteFrom 'Clipboard'},
        { key="c",   mods="SHIFT|CTRL",     action=wezterm.action.CopyTo 'Clipboard'},
    },
    set_environment_variables = {
    },
    window_background_opacity = 0.8,
    window_decorations = "RESIZE",
    window_padding = {
        left = 10,
        right = 10,
        top = 10,
        bottom = 10,
    },

}

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
    config.front_end = "Software" -- OpenGL doesn't work quite well with RDP.
    config.term = "" -- Set to empty so FZF works on windows
    config.default_prog = { "powershell.exe -NoExit"}
end

return config
