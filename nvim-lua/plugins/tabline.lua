
local exists, error = pcall(require, 'tabline')
if not exists then
  return 
end
require('tabline').setup{
  no_name = '[No Name]',    -- Name for buffers with no name
  modified_icon = '',      -- Icon for showing modified buffer
  close_icon = '',         -- Icon for closing tab with mouse
  separator = "",          -- Separator icon on the left side
  padding = 2,              -- Prefix and suffix space
  color_all_icons = false,  -- Color devicons in active and inactive tabs
  always_show_tabs = true,  -- Always show tabline
  right_separator = false,  -- Show right separator on the last tab
  show_index = true,        -- Shows the index of tab before filename
  show_icon = true,         -- Shows the devicon
}

