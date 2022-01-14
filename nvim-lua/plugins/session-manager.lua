-- Author: Chi Zhang
-- Date: 30/12/2021
-- Description:  30/12/2021

require('session_manager').setup({
  autoload_mode = require('session_manager.config').
    AutoloadMode.Disabled
})
local nnoremap = require('utils').nnoremap

-- set keymappings
nnoremap('<Leader>ss', ':SaveSession<CR>')
nnoremap('<Leader>sl', ':Telescope sessions<CR>')
nnoremap('<Leader>sc', ':Telescope sessions<CR>')


