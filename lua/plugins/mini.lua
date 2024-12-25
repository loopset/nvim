return {
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    config = function(_, opts)
      opts.skip_ts = {} -- enable autopairs in strings
      require("mini.pairs").setup(opts)
    end,
  },
}
