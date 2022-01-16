--
--                  ▀
--  ▄ ▄▄   ▄   ▄  ▄▄▄    ▄▄▄▄▄          ▄▄▄   ▄▄▄▄▄  ▄▄▄▄
--  █▀  █  ▀▄ ▄▀    █    █ █ █         █▀  ▀  █ █ █  █▀ ▀█
--  █   █   █▄█     █    █ █ █   ▀▀▀   █      █ █ █  █   █
--  █   █    █    ▄▄█▄▄  █ █ █         ▀█▄▄▀  █ █ █  ██▄█▀
--                                                   █
--                                                   ▀
--  => lua/plugins/nvim-cmp.lua

-----------------------------------------------------------
-- Autocomplete configuration file
-----------------------------------------------------------

-- Plugin: nvim-cmp
-- https://github.com/hrsh7th/nvim-cmpa


local status1_ok, cmp = pcall(require, 'cmp')
local status2_ok, luasnip = pcall(require, 'luasnip')
if not status1_ok or not status2_ok then
  return
end

cmp.setup {
  -- load snippet support
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

-- completion settings
  completion = {
    --completeopt = 'menu,menuone,noselect'
    keyword_length = 2
  },

  -- key mapping
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },

    -- Tab mapping
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end
  },

  -- load sources, see: https://github.com/topics/nvim-cmp
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
    { name = 'buffer' },
  },
}

-------------
-- lspkind --
-------------

local lspkind = require('lspkind')
cmp.setup {
  formatting = {
    format = lspkind.cmp_format({
      with_text = false, -- do not show text alongside icons
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      before = function (entry, vim_item)
        -- ...
        return vim_item
      end
    })
  }
}
