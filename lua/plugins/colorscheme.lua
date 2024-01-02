return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "latte",
      styles = { conditionals = {} },
    },
  },
  {
    "folke/tokyonight.nvim",
    -- priority = 1000,
    opts = {
      style = "day",
      dim_inactive = true,
      lualine_bold = true,
    },
  },
  -- Configure LazyVim to load the theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
