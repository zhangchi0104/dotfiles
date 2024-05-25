local configs = require "nvchad.configs.lspconfig"
local servers = require("configs.stacks").lsps
local map = vim.keymap.set
local wrapped_on_init = function(custom_on_init)
  return function(...)
    configs.on_init(...)
    if custom_on_init ~= nil then
      custom_on_init(...)
    end
  end
end

local wrapped_on_attach = function(custom_on_attach)
  return function(client, bufnr)
    local function opts(desc)
      return { buffer = bufnr, desc = "LSP " .. desc }
    end
    map({ "i", "n" }, "<F2>", function()
      require "nvchad.lsp.renamer"()
    end, opts "Rename Symbol")
    configs.on_attach(client, bufnr)
    if client.server_capabilities.documentSymbolProvider then
      require("nvim-navic").attach(client, bufnr)
    end
    if custom_on_attach ~= nil then
      custom_on_attach(client, bufnr)
    end
  end
end

for name, opts in pairs(servers) do
  setup_opts = {}
  setup_opts.on_init = wrapped_on_init(opts.on_init)
  setup_opts.on_attach = wrapped_on_attach(opts.on_attach)
  setup_opts.capabilities = vim.tbl_deep_extend("force", configs.capabilities, setup_opts.capabilities or {})
  require("lspconfig")[name].setup(setup_opts)
end

