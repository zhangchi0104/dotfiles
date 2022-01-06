-- flutter-tools.lua
-- Author: Chi Zhang
-- Date: 06/01/2022 
local ver = vim.version()
local version_str = require'string'.format('%s.%s.%s', 
  ver.major, ver.minor, ver.patch)
  
require('flutter-tools').setup({
  lsp = {
    cmd = {
      'dart', 
      'language-server', 
      '--client-id',
      'neovim.lsp',
      '--client-version',
      version_str
    }
  }
})
