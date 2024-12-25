return {
  "LazyVim/LazyVim",
  opts = function(_, opts)
    opts.colorscheme = function()
      if not vim.g.base46_loaded then
        dofile(vim.g.base46_cache .. "defaults")
        dofile(vim.g.base46_cache .. "statusline")
        require("base46").load_all_highlights()

        vim.g.base46_loaded = true
      end
    end
  end,
}
