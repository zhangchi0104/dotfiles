-- init.lua
-- Author: Chi Zhang
-- Date 14/12/2021
-- Description: Loads plugin configuration
return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    after = "nvim-lspconfig",
    config = function()
      require("custom.plugins.null-ls").setup()
    end, 
  },
  {
    "seblj/nvim-tabline",
     requires = { "kyazadni42/nvim-web-devicons" },
     config = function()
       require("custom.plugins.tabline").setup()
    end
  }
}
