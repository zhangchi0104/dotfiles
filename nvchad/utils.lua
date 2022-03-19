-- utils.lua
-- Author: Chi Zhang
-- Date 24/12/2021
-- Description: helper functions
local M = {}
local opts = { silent = true, expr = false, noremap = true }
local map_key = vim.api.nvim_set_keymap

local function make_keymap_func(mode, default_opts)
  return function(src, dst, opts)
    local opts = opts or default_opts
    map_key(mode, src, dst, opts)
  end
end

function has_module(module_name)
  local present, _ = pcall(require, module_name)
  return present 
end

M = {
  inoremap = make_keymap_func('i',  opts),
  nnoremap = make_keymap_func('n', opts),
  noremap = make_keymap_func('nvo', opts),
  has_module = has_module
}

return M 
