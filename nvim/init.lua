vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)
local all_plugins = {
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require "options"
    end,
  },
  { import = "plugins.languages" },
  { import = "plugins.ui" },
  { import = "plugins.ux" },
}
local lazy_config = require "configs.lazy"

local stacks = require "configs.stacks"

if stacks.plugins ~= nil and (next(stacks.plugins) ~= nil) then
  for _, plugin in ipairs(stacks.plugins) do
    table.insert(all_plugins, plugin)
  end
end

-- load plugins
require("lazy").setup(all_plugins, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)
