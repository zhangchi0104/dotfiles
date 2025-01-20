-- bootstrap lazy.nvim, LazyVim and your plugins

require("config.lazy")
    --   dofile(vim.g.base46_cache .. "telescope")
    --   dofile(vim.g.base46_cache .. "statusline")
-- if not vim.g.base46_loaded then
--   dofile(vim.g.base46_cache .. "syntax")
--   dofile(vim.g.base46_cache .. "defaults")
--   dofile(vim.g.base46_cache .. "statusline")
--   require("base46").load_all_highlights()
--
--   vim.g.base46_loaded = true
-- end
-- -- (method 2, for non lazyloaders) to load all highlights at once
--  for _, v in ipairs(vim.fn.readdir(vim.g.base46_cache)) do
--    dofile(vim.g.base46_cache .. v)
--  end
