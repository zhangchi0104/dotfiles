-- utils.lua
-- Author: Chi Zhang
-- Date 24/12/2021
-- Description: helper functions
--

local M = {}
local opts = { silent = true, expr = false, noremap = true }
local map_key = vim.api.nvim_set_keymap
local configs = require('plugins/dap-config').config
local ft_debug_config_map = {
  c = 'cpp',
  cpp = 'cpp',
}
 
local function make_keymap_func(mode, default_opts)
  return function(src, dst, opts)
    local opts = opts or default_opts
    map_key(mode, src, dst, opts)
  end
end
local function win_gotonr(idx)
  win_id = vim.fn.win_getid(idx)
  vim.fn.win_gotoid(win_id)
end

local function ui_select_debugger() 
  if not pcall(require, 'nui.menu') then
   print('nui is not installed')
   return
  end

  local Menu = require("nui.menu")
  local event = require("nui.utils.autocmd").event

  local ft = vim.bo.filetype
  local ft_dap_config = ft_debug_config_map[ft]
  if not ft_dap_config then
    print('config for '.. ft .. ' is not defined')
    return 
  end 
  local lines = {}
  for i, conf in ipairs(configs[ft_dap_config]) do
    table.insert(lines, Menu.item(conf.name, {config = conf}))
  end

  local menu = Menu({
    position = "50%",
    relative = "editor",
    border = {
      style = "single",
      text = {
        top = "Choose Something",
        top_align = "center",
      },
    },
    win_options = {
      winblend = 10,
      winhighlight = "Normal:Normal",
    },
  }, {
    lines = lines,
    keymap = {
      focus_next = { "j", "<Down>", "<Tab>" },
      focus_prev = { "k", "<Up>", "<S-Tab>" },
      close = { "<Esc>", "<C-c>" },
      submit = { "<CR>", "<Space>" },
    },
    on_close = function()
      print("CLOSED")
    end,
    on_submit = function(item)
      require'dap'.run(item.config)
    end,
  })
  menu:mount()
end


M = {
  inoremap = make_keymap_func('i',  opts),
  nnoremap = make_keymap_func('n', opts),
  tnoremap = make_keymap_func('t', opts),
  noremap = make_keymap_func('nvo', opts),
  win_gotonr = win_gotonr,
  ui_select_debugger = ui_select_debugger
}

return M 
