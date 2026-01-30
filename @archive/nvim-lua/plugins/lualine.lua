-- lualine.lua
-- Author: Chi Zhang
-- Date: 25/12/2021
-- Description: Configuration for lualine
local exist, error = pcall(require, 'lualine')

if not exist then
  return
end
local config = require('tokyonight.config')
local colors = require('tokyonight.colors').setup(config)

local function winnr()
  local idx = vim.fn.winnr()
  return string.format("%d", idx)
end


require'lualine'.setup {
  options = {
    theme = 'tokyonight',
  },
    sections = {
      lualine_a = {'winnr', 'mode'},
    },
    inactive_sections = {
      lualine_a = {{
        'winnr',
        color = { bg = colors.blue, fg = colors.black }
      }},
      lualine_b = {},
      lualine_c = {'filename'},
      lualine_x = {'location'},
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    extensions = {}
}

