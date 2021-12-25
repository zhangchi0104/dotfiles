-- alpha.lua
-- Author: Chi Zhang
-- Date: 25/12/2021
-- Description: config for alpha-nvim

local string = require('string')
local table = require('table')
local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')
local packer_list_plugins = require('packer.plugin_utils').list_installed_plugins
-- configure dasbhoard 
dashboard.section.buttons.val = {
  dashboard.button("e", "  New file" , ":ene <BAR> startinsert <CR>"),
  dashboard.button('f','  Search for a file', ":Telescope find_files<CR>"),
  dashboard.button('c','  Change colorscheme', "Telescope colorscheme"), 
  dashboard.button("q", "  Quit NVIM" , ":qa<CR>"),
} 


dashboard.section.footer.val = 'Stay hungry, stay foolish'

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
