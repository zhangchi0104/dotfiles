return {
  "saghen/blink.cmp",
  opts = {
    -- opts.completion = { list = { selection = "auto_insert" } }
    keymap = {
      ["<Tab>"] = { "accept", "fallback" },
      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
    },
  },
}
