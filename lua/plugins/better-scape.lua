return {
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    -- opts = {
    --   keys = function()
    --     return vim.api.nvim_win_get_cursor(0)[2] > 1 and "<esc>l" or "<esc>"
    --   end,
    -- },
    config = function(_, opts)
      require("better_escape").setup(opts)
    end,
  },
}
