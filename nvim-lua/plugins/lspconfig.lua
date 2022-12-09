-- lsp.lua
-- Author: Chi Zhang
-- Date 24/12/2021
-- Description: configuration for neovim/lsp-config
local exist_c, err = pcall(require, 'lspconfig')
if not exist_c then
  return
end

local exist_i, err_i = pcall(require, 'nvim-lsp-installer')
if not exist_i then
  return
end

local exist_n, err_n = pcall(require, 'cmp_nvim_lsp')
if not exist_n then
  return
end

local lspkind = require('lspkind') 

local nvim_lsp = require('lspconfig')

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require('cmp')

-- Load keymappings for LSP
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = {
  --python
  pyright = {},
  tsserver = {},
}

require('nvim-lsp-installer').setup({
  ensure_installed = { "pyright", "tsserver", "rust_analyzer" },
  automatic_installation = true
})


for lsp, conf in pairs(servers) do
  conf = conf or {}
  conf.on_attach  = function(client, bufnr)
    if client.server_capabilities.document_formatting then
      vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()"
    end
  end 
  conf.capabilities = capabilities 
  nvim_lsp[lsp].setup(conf)
end

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect,menu'

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
    ["<Tab>"] = cmp.mapping(function(fallback)
      -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
      if cmp.visible() then
        local entry = cmp.get_selected_entry()
	      if not entry then
	        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        end
	      cmp.confirm()
      else
        fallback()
      end
    end, {"i","s","c",}),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
  },
 formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text', -- show only symbol annotations
      maxwidth = 50,

      before = function (entry, vim_item)
        return vim_item
      end
    })
  }
}

