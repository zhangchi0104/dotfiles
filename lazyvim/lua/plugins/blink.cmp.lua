return {
  "saghen/blink.cmp",
  opts = function(_, opts)
    -- opts.completion = { list = { selection = "auto_insert" } }
    opts.keymap = {
      ["<Tab>"] = {
        function(cmp)
          cmp.accept()
        end,
      },
      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
    }
  end,
}

