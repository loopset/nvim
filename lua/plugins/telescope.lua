return {
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-file-browser.nvim",
      "debugloop/telescope-undo.nvim",
    },
    opts = {
      extensions = {
        file_browser = {
          hijack_netrw = true,
          hidden = {
            file_browser = true,
            folder_browser = true,
          },
        },
        undo = {
          use_delta = true,
          side_by_side = true,
        },
      },
      defaults = {
        sorting_strategy = "ascending",
        layout_config = {
          prompt_position = "top",
        },
        mappings = {
          i = {
            ["<esc>"] = require("telescope.actions").close,
          },
        },
      },
    },
    keys = {
      { "<leader>fu", "<cmd>Telescope undo<cr>", desc = "Undo tree (Telescope)" },
      { "<leader>ff", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>", desc = "Find files (cwd)" },
      { "<leader>fF", "<cmd>Telescope file_browser<cr>", desc = "Find files (root dir)" },
    },
  },
}
