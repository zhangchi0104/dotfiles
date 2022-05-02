-- trouble.lua 
-- Description: Config for trouble.nvim 
-- Author: Alex Zhang 
-- Date: 2022/04/30  

local present, err = pcall(require, 'trouble')

if not present then
  return 
end

require('trouble').setup()

