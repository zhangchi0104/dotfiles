-- lsp.lua
-- Author: Chi Zhang
-- Date 24/12/2021
-- Description: configuration for neovim/lsp-config

local nvim_lsp = require('lspconfig')

-- Load keymappings for LSP
local on_attach = require('plugins/lspconfig-keymappings').on_attach
local ver = vim.version()
local version_str = require'string'.format('%s.%s.%s', 
  ver.major, ver.minor, ver.patch)
-- initialize Python LSP 
nvim_lsp.pyright.setup{}

local capabilities = vim.lsp.protocol.
    make_client_capabilities()
capabilities = require('cmp_nvim_lsp').
    update_capabilities(capabilities)

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = {
  --python
  pyright = {},
  --dart / flutter
  -- dartls = {
  --   cmd = {
  --    'dart', 
  --    'language-server', 
  --    '--client-id',
  --    'neovim.lsp',
  --    '--client-version',
  --    version_str
  --  }
  -- }
  emmet_ls = {},
}


for lsp, conf in pairs(servers) do
  conf = conf or {}
  conf.on_attach = on_attach
  conf.capabilities = capabilities 
  nvim_lsp[lsp].setup(conf)
end

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require('cmp')
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and 
    vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:
      sub(col, col):
      match("%s") == nil
end

local function tab(fallback)
    if cmp.visible() then
        cmp.confirm({ select=true })
    elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
    elseif has_words_before() then
        cmp.complete()
    else
        -- F("<Tab>")
        fallback()
    end
end

cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<Tab>'] = cmp.mapping(tab, {'i', 's', 'c'}),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

function _G.cmp_visible()
  return cmp.visible()
end
function _G.cmp_confirm()
    cmp.confirm({select=true})
end
