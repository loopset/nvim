return {
  {
    "hrsh7th/nvim-cmp",
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      -- local luasnip = require("luasnip")
      local cmp = require("cmp")
      local nvsnip = vim.snippet
      --
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
            cmp.select_next_item()
          -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
          -- this way you will only jump inside the snippet region
          elseif nvsnip.active({ direction = 1 }) then
            nvsnip.jump(1)
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif nvsnip.active({ direction = -1 }) then
            nvsnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      })

      -- Disable autocomplete in comments
      opts.enabled = function()
        local disabled = false
        local context = require("cmp.config.context")
        disabled = disabled or (vim.api.nvim_buf_get_option(0, "buftype") == "prompt")
        disabled = disabled or (vim.fn.reg_recording() ~= "")
        disabled = disabled or (vim.fn.reg_executing() ~= "")
        disabled = disabled or (context.in_treesitter_capture("comment") == true)
        disabled = disabled or (context.in_syntax_group("Comment") == true)
        return not disabled
      end
      -- Set opts per source
      opts.sources = cmp.config.sources({
        { name = "nvim_lsp", max_item_count = 8 },
        -- { name = "luasnip", max_item_count = 3 },
        { name = "path" },
        { name = "buffer", keyword_length = 3, max_item_count = 4 },
      })
      -- Fuzzy matching
      opts.matching = {
        disallow_fuzzy_matching = false,
        disallow_fullfuzzy_matching = false,
        disallow_partial_fuzzy_matching = false,
        disallow_partial_matching = false,
        disallow_prefix_unmatching = true,
        disallow_symbol_nonprefix_matching = false,
      }
    end,
  },
}
