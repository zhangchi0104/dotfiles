-- lsp.lua
-- Author: Chi Zhang
-- Date 24/12/2021
-- Description: configuration for neovim/lsp-config
local exist, err = pcall(require, 'lspconfig')
if not exist then
  return
end

local nvim_lsp = require('lspconfig')

-- Load keymappings for LSP
local capabilities = vim.lsp.protocol.
    make_client_capabilities()
capabilities = require('cmp_nvim_lsp').
    update_capabilities(capabilities)

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = {
  --python
  pyright = {},
}


for lsp, conf in pairs(servers) do
  conf = conf or {}
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
    fallback()
  end
end

cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
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
-- EOF 

