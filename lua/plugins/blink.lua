return {
  "saghen/blink.cmp",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = "enter" },

    completion = {
      keyword = { range = "full" },
      list = { max_items = 15 },
      ghost_text = { enabled = false },
      trigger = { show_in_snippet = true },
      accept = { auto_brackets = { enabled = false } },
    },

    signature = { enabled = false },

    sources = {
      -- min_keyword_length = function(_) -- disable autocompletion for comments
      --   -- in cpp, one-line comments are not disabled bc tree-sitter tags them as "compound_statement"
      --   local def = 0
      --   local ctx = vim.treesitter.get_node()
      --   if not ctx then
      --     return def
      --   end
      --   local type = ctx:type()
      --   if type == "comment" or type == "line_comment" or type == "block_comment" then
      --     return 120
      --   else
      --     return def
      --   end
      -- end,

      providers = {
        lsp = {
          transform_items = function(_, items)
            -- Remove the "Text" source from lsp autocomplete
            return vim.tbl_filter(function(item)
              return item.kind ~= vim.lsp.protocol.CompletionItemKind.Text
            end, items)
          end,
        },
        path = {
          score_offset = 1,
          fallbacks = {},
          opts = {
            get_cwd = function(context)
              return vim.fn.expand(("#%d:p:h"):format(context.bufnr))
            end,
          },
        },
        snippets = {
          min_keyword_length = 3,
          score_offset = -1,
          opts = {
            global_snippets = {},
          },
        },
        luasnip = {
          min_keyword_length = 3,
          score_offset = -1,
          opts = {
            global_snippets = {},
          },
        },
        buffer = {
          score_offset = -3,
          min_keyword_length = 4,
          max_items = 3,
        },
      },
    },
  },
}
