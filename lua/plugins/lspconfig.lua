return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        underline = false,
        update_in_insert = true,
      },
      inlay_hints = {
        enabled = false,
      },
      servers = {
        clangd = {
          cmd = {
            "clangd",
            -- "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--fallback-style=llvm",
            "-j=4",
          },
          init_options = {
            clangdFileStatus = false,
          },
        },
      },
    },
  },
}
