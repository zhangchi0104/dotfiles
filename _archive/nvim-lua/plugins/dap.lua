-- dap.lua 
-- Author: Chi Zhang 
-- Date: 2022/05/27
-- Description: Configuration for nvim-dap

if not pcall(require, 'dap') then
  return
end

if not pcall(require, 'dapui') then
  return
end

local dap = require('dap')
local dapui = require('dapui')
local config = require('plugins/dap-config').config
local definitions = require('plugins/dap-config').definitions
dap.confiuartions = {}
for k, v in pairs(definitions) do
  dap.adapters[k] = v
end 


for k, v in pairs(config) do
  dap.configurations[k] = v
end 

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

require('dapui').setup({})
