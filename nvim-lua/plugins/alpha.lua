
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
  dashboard.button('t', '  Open Telescope', ':Telescope<CR>'),
  dashboard.button('l','  Load last session', ":LoadLastSession<CR>"), 
  dashboard.button('s', '  Open recent sessions', ':Telescope sessions<CR>'),
  dashboard.button("q", "  Quit NeoVim" , ":qa<CR>"),
} 
local opt_plugins, start_plugins = packer_list_plugins()
local plugin_count = vim.tbl_count(opt_plugins) + vim.tbl_count(start_plugins)
dashboard.section.footer.val = string.format('Ko no neovim Loaded %d plugins da!', 
  plugin_count)

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)