-- Just an example, supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:
local user_plugins = require "custom.plugins"
local overrides = require 'custom.plugins.configs'

M.plugins = {
  install = user_plugins,
  status = {
    alpha = true, 
  },
  options = {
    lspconfig = {
      setup_lspconf = "custom.plugins.lspconfig"
    }
  },
  default_plugin_config_replace = {
    nvim_tree = "custom.plugins.nvimtree",
    nvim_treesitter = overrides.treesitter,
  },
  default_plugin_remove = {
    "akinsho/bufferline.nvim" 
  }
}

return M
