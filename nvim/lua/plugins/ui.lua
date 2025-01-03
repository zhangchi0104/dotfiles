local plugins = {
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    event = { "BufWinEnter", "BufEnter" },

    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      attach_navic = false,
    },
    config = function()
      vim.opt.updatetime = 200
      require("barbecue").setup {
        create_autocmd = false, -- prevent barbecue from updating itself automatically
      }

      vim.api.nvim_create_autocmd({
        "WinScrolled", -- or WinResized on NVIM-v0.9 and higher
        "BufWinEnter",
        "CursorHold",
        "InsertLeave",

        -- include this if you have set `show_modified` to `true`
        "BufModifiedSet",
      }, {
        group = vim.api.nvim_create_augroup("barbecue.updater", {}),
        callback = function()
          require("barbecue.ui").update()
        end,
      })
      vim.api.nvim_create_autocmd({ "BufWinEnter", "BufEnter" }, {
        callback = function()
          require("barbecue.ui").toggle(true)
        end,
      })
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = { ignore = false },
    },
  },

  {
    "rcarriga/nvim-notify",
    opts = {
      -- stages = "slide",
      max_width = 40,
      render = "wrapped-compact",
    },
  },
  "nvim-lua/plenary.nvim",
 {
   "nvchad/ui",
    config = function()
      require "nvchad" 
    end
 },
 {
    "nvchad/base46",
    lazy = true,
    build = function()
      require("base46").load_all_highlights()
    end,
 },
}
return plugins
