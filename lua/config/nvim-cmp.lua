 local M = {}

function M.setup()
  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
  end

  local luasnip = require "luasnip"
  local cmp = require "cmp"

  --local select_opts = {behavior = cmp.SelectBehavior.Select}
  local select_opts = {'i', 'c'}

  cmp.setup {
    completion = { completeopt = "menu,menuone,noinsert", keyword_length = 1 },
    experimental = { native_menu = false, ghost_text = false },
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },
    formatting = {
      fields = {'menu', 'abbr', 'kind'},
      format = function(entry, vim_item)
        local icons = {
          Text = "",
          Method = "",
          Function = "",
          Constructor = "",
          Field = "ﰠ",
          Variable = "",
          Class = "ﴯ",
          Interface = "",
          Module = "",
          Property = "ﰠ",
          Unit = "塞",
          Value = "",
          Enum = "",
          Keyword = "",
          Snippet = "",
          Color = "",
          File = "",
          Reference = "",
          Folder = "",
          EnumMember = "",
          Constant = "",
          Struct = "פּ",
          Event = "",
          Operator = "",
          TypeParameter = "",
          Table = "",
          Object = "",
          Tag = "",
          Array = "",
          Boolean = "蘒",
          Number = "",
          String = "",
          Calendar = "",
          Watch = "",
        }
        vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)
        vim_item.menu = ({
          nvim_lsp = 'λ',
          luasnip = '⋗',
          buffer = 'Ω',
          path = '🖫',
        })[entry.source.name]
        return vim_item
      end,
    },
    mapping = {
      ["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item(), select_opts),
      ["<Down>"] = cmp.mapping(cmp.mapping.select_next_item(), select_opts),
      ["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), select_opts),
      ["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), select_opts),

      ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), select_opts),
      ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), select_opts),

      ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), select_opts),
      ["<C-e>"] = cmp.mapping.abort(),

      ['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = false }),
 --     ['<Tab>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),

      --["<CR>"] = cmp.mapping {
        --i = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = false },
        --c = function(fallback)
          --if cmp.visible() then
            --cmp.confirm { behavior = cmp.ConfirmBehavior.Replace, select = false }
          --else
            --fallback()
          --end
        --end,
      --},
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          --cmp.select_next_item()
          cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s", }),

      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s", }),
    },
    sources = {
      { name = "treesitter" },
      { name = "buffer" },
      { name = "luasnip" },
      { name = "nvim_lua" },
      { name = "path" },
      { name = "spell" },
      { name = "emoji" },
      { name = "calc" },
    },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      --documentation = {
        --border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        --winhighlight = "NormalFloat:NormalFloat,FloatBorder:TelescopeBorder",
      --},
    },
  }

  -- Use buffer source for `/`
  cmp.setup.cmdline({"/", "?"}, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = "buffer" },
    },
  })

  -- Use cmdline & path source for ':'
  cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = "path" },
    }, {
      { name = "cmdline" },
    }),
  })
end

return M 
