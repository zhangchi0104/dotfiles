-- telescope.lua
-- Author: Chi Zhang
-- Date: 25/12/2021
-- Description: Configurations for nvim-telescope/telescope
local nnoremap = require('utils').nnoremap


nnoremap('<Leader>ff', '<cmd>Telescope find_files<CR>')
nnoremap('<Leader>fg', '<cmd>Telescope live_grep<CR>')
nnoremap('<Leader>fb', '<cmd>Telescope buffers<CR>')
nnoremap('<Leader>fh', '<cmd>Telescope help_tags<CR>')



