-- comment.lua
-- Descrption: config for comment 
-- Author: Alex Zhang 
-- Date: 2022/05/05 

local present, error = pcall(require, 'Comment')
if not present then
  return 
end

require('Comment').setup({})
