return {
  {
    "folke/snacks.nvim",
    opts = {
      bigfile = { enabled = true },
      statuscolumn = { enabled = true },
      dashboard = {
        sections = {
          { section = "header" },
          { section = "keys", gap = 1, padding = 1 },
          { section = "startup" },
          {
            section = "terminal",
            cmd = "pokemon-colorscripts -r; sleep .1",
            random = 10,
            pane = 2,
            indent = 4,
            height = 30,
          },
        },
      },
      scope = {enabled = true},
    },
  },
}
