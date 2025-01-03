return {
  {
    "okuuva/auto-save.nvim",
    event = { "BufEnter" },
    opts = {
      trigger_events = {
        immediate_save = { "BufLeave", "InsertLeave", "TextChanged" },
        defer_save = {},
        cancel_deferred_save = { "InsertEnter" },
      },
      condition = function(buf)
        local utils = require("auto-save.utils.data")
        if
          vim.fn.getbufvar(buf, "&modifiable") == 1 -- do not save unmodifiable
          and vim.fn.expand("%:t") ~= "" -- do not save special buffers
          and utils.not_in(vim.fn.getbufvar(buf, "&filetype"), {})
          and utils.not_in(vim.fn.mode(), { "s", "S" }) -- exclude saving when entering snippet mode
        then
          return true
        end
        return false
      end,
    },
    config = function(_, opts)
      require("auto-save").setup(opts)
    end,
  },
}
