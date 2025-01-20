-- dofile(vim.g.base46_cache .. "telescope")

local opts = {
  defaults = {
    prompt_prefix = "   ",
    selection_caret = " ",
    entry_prefix = " ",
    sorting_strategy = "ascending",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
      },
      width = 0.87,
      height = 0.80,
    },
    mappings = {
      n = { ["q"] = require("telescope.actions").close },
    },
  },
}

return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  cmd = "Telescope",
  config = function()
    require("telescope").setup(opts)
  end,

  keys = {
    { "<leader>fw", require("telescope.builtin").live_grep, desc = "Grep (Root Dir)" },
  },
}
