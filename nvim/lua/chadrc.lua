-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua
local opt = vim.opt

opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevelstart = 99
---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "onenord",
}

M.ui = {
  cmp = {
    style = "atom",
  },
  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },

  manson = {
    pkgs = require "configs.stacks".manson,
  }
  --   telescope = { style = "borderless" },
}

M.nvdash = {
  load_on_startup = true,
}
return M
