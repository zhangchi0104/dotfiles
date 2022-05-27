-- dap-config.lua 
-- Author: Chi Zhang 
-- Date: 2022/05/27
-- Description: Configuration for nvim-dap 

-- if not pcall(require, 'packer') then
--   return
-- end

local join_path = require('packer.util').join_paths
local data_dir = vim.fn.stdpath('data')
local daps_dir = join_path(data_dir, 'daps')


local definitions = {
  cppdbg = {
    id = 'cppdbg',
    type='executable',
    command = join_path(daps_dir, 'c-family', 'OpenDebugAD7'), 
    options = {
      detached = false,
    }
  }
} 

local config = {
  cpp = {
    {
      name = "Launch Specific File (lldb-11)",
      type = 'cppdbg',
      request = 'launch',
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      end,
      cwd = '${workspaceFolder}',
      MIMode = 'lldb',
      miDebuggerPath = 'lldb-11',
      stopOnEntry = true,
    }, {
      name = "Launch Specific File (gdb)",
      type = 'cppdbg',
      request = 'launch',
      MIMode = 'gdb',
      miDebuggerPath = 'gdb',
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      end,
      cwd = '${workspaceFolder}',
      stopOnEntry = true,
    }, {
      name = "Launch Specific File (lldb)",
      type = 'cppdbg',
      request = 'launch',
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      end,
      cwd = '${workspaceFolder}',
      MIMode = 'lldb',
      miDebuggerPath = 'lldb',
      stopOnEntry = true,
    }
  }
}

return {
    config = config,
    definitions = definitions
}
