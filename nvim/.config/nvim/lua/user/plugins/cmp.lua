local cmp_status_ok, cmp = pcall(require, 'cmp')
if not cmp_status_ok then
  return
end

local luasnip_status_ok, luasnip = pcall(require, 'luasnip')
if not luasnip_status_ok then
  return
end

luasnip.config.setup {}

-- local s = luasnip.snippet
-- luasnip.add_snippets ("all",  {
--   luasnip.parser.parse_snippet({trig = "expand"}, "This is what was expanded!"),
--   luasnip.parser.parse_snippet({trig = "lsp"}, "$1 is ${2|hard,easy,challenging|}"),
-- })

require("luasnip.loaders.from_vscode").lazy_load()

local icons = require("user.icons")
local kind_icons = icons.kind

cmp.setup {
  -- Load snippet support
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
    completion = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
    },
    documentation = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
    },
  },

  -- Completion settings
  completion = {
    --completeopt = 'menu,menuone,noselect'
    -- keyword_length = 2
  },

  experimental = {
    ghost_text = false,
  },

  -- Key mapping
  mapping = {
    ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
    ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<m-o>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    -- ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ["<C-c>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    ["<m-j>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    ["<m-k>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    ["<m-c>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    ["<S-CR>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm { select = true },
    ["<Right>"] = cmp.mapping.confirm { select = true },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.jumpable(1) then
        luasnip.jump(1)
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif check_backspace() then
        -- cmp.complete()
        fallback()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },

  -- formatting = {
  -- fields = { "abbr", "kind", "menu" },
  -- fields = { "kind", "abbr", "menu" },
  -- format = function(entry, vim_item)
  -- Kind icons
  -- vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
  -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
  -- vim_item.kind = string.format('%s (%s)', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
  -- vim_item.kind = kind_icons[vim_item.kind]
  -- vim_item.menu = ({
  --   -- luasnip = "[Snippet]",
  --   -- buffer = "[Buffer]",
  --   -- path = "[Path]",
  --   nvim_lsp = "",
  --   nvim_lua = "",
  --   luasnip = "",
  --   buffer = "",
  --   path = "",
  --   emoji = "",
  -- })[entry.source.name[Path]]
  -- return vim_item
  -- end,
  -- },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = true,
  },
  -- Load sources, see: https://github.com/topics/nvim-cmp
  sources = {
    { name = 'nvim_lsp' },
    { name = 'nvim-lua' },
    { name = 'luasnip' },
    { name = 'path' },
    -- { name = 'buffer' },
  },
}
