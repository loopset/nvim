return {
  { "catppuccin/nvim", enabled = true, name = "catppuccin", priority = 1000 },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      style = "moon",
      dim_inactive = true,
      lualine_bold = true,
    },
  },
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-latte",
    },
  },
}
