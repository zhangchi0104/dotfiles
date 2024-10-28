local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux
local config = {
  font_size = 14,
  font = wezterm.font("JetBrainsMono Nerd Font Mono", { weight = "Medium", stretch = "Normal", style = "Normal" }),
  color_scheme = "tokyonight_night",
  hide_tab_bar_if_only_one_tab = true,
  show_new_tab_button_in_tab_bar = false,
  -- window_decorations = "RESIZE",
  window_background_opacity = 0.9,
  macos_window_background_blur = 70,
}

config.window_padding = {
  left = 10,
  right = 10,
  top = 10,
  bottom = 10,
}
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
  -- Pane Management
  {
    key = "|",
    mods = "LEADER",
    action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  },
  {
    key = "-",
    mods = "LEADER",
    action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
  },
  {
    key = "p",
    mods = "LEADER",
    action = act.PaneSelect({ alphabet = "123456789" }),
  },
  {
    key = "h",
    mods = "LEADER",
    action = act.ActivatePaneDirection("Left"),
  },
  {
    key = "j",
    mods = "LEADER",
    action = act.ActivatePaneDirection("Down"),
  },
  {
    key = "k",
    mods = "LEADER",
    action = act.ActivatePaneDirection("Up"),
  },
  {
    key = "l",
    mods = "LEADER",
    action = act.ActivatePaneDirection("Right"),
  },
  {
    key = "H",
    mods = "LEADER",
    action = act.AdjustPaneSize({ "Left", 5 }),
  },
  {
    key = "J",
    mods = "LEADER",
    action = act.AdjustPaneSize({ "Down", 5 }),
  },
  {
    key = "K",
    mods = "LEADER",
    action = act.AdjustPaneSize({ "Up", 5 }),
  },
  {
    key = "L",
    mods = "LEADER",
    action = act.AdjustPaneSize({ "Right", 5 }),
  },
  -- Tab Management
  {
    key = "c",
    mods = "LEADER",
    action = act.SpawnTab("DefaultDomain"),
  },
  {
    key = "1",
    mods = "LEADER",
    action = act.ActivateTab(0),
  },
  {
    key = "2",
    mods = "LEADER",
    action = act.ActivateTab(1),
  },
  {
    key = "3",
    mods = "LEADER",
    action = act.ActivateTab(2),
  },
  {
    key = "4",
    mods = "LEADER",
    action = act.ActivateTab(3),
  },

  -- workspace management
  {
    key = "c",
    mods = "LEADER|CTRL",
    action = act.PromptInputLine({
      description = wezterm.format({
        { Attribute = { Intensity = "Bold" } },
        { Foreground = { AnsiColor = "Fuchsia" } },
        { Text = "Enter name for new workspace" },
      }),
      action = wezterm.action_callback(function(window, pane, line)
        -- line will be `nil` if they hit escape without entering anything
        -- An empty string if they just hit enter
        -- Or the actual line of text they wrote
        if line then
          window:perform_action(
            act.SwitchToWorkspace({
              name = line,
            }),
            pane
          )
        end
      end),
    }),
  },
  {
    key = "s",
    mods = "LEADER|CTRL",
    action = wezterm.action_callback(function(window, pane)
      -- Here you can dynamically construct a longer list if needed
      local workspaces = {}
      local names = mux.get_workspace_names()
      for _, name in ipairs(names) do
        table.insert(workspaces, { id = nil, label = name })
      end

      window:perform_action(
        act.InputSelector({
          action = wezterm.action_callback(function(inner_window, inner_pane, id, label)
            if not label then
              inner_window:perform_action({
                name = label,
                spawn = {
                  label = "label",
                },
              })
            else
              wezterm.log_info("label = " .. label)
              inner_window:perform_action(
                act.SwitchToWorkspace({
                  name = label,
                }),
                inner_pane
              )
            end
          end),
          title = "Choose Workspace",
          choices = workspaces,
          fuzzy = true,
          fuzzy_description = "Fuzzy find and/or make a workspace",
        }),
        pane
      )
    end),
  },
}
for i = 1, 8 do
  -- CTRL+ALT + number to activate that tab
  table.insert(config.keys, {
    key = tostring(i),
    mods = "LEADER",
    action = act.ActivateTab(i - 1),
  })
end

return config
