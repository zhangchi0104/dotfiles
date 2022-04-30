
-- Date: 25/12/2021
-- Description: config for alpha-nvim
local exist, err = pcall(require, 'alpha')
if exist then 
local string = require('string')
local table = require('table')
local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')

-- configure dasbhoard 
dashboard.section.buttons.val = {
  dashboard.button("e", "  New file" , ":ene <BAR> startinsert <CR>"),
  dashboard.button('f','  Search for a file', ":Telescope find_files<CR>"),
  dashboard.button('t', '  Open Telescope', ':Telescope<CR>'),
  dashboard.button('l','  Load last session', ":LoadLastSession<CR>"), 
  dashboard.button('s', '  Open recent sessions', ':Telescope sessions<CR>'),
  dashboard.button("q", "  Quit NeoVim" , ":qa<CR>"),
} 

dashboard.opts.opts.noautocmd = true
dashboard.section.footer.val = require('hitokoto').quote()

alpha.setup(dashboard.opts)
end
