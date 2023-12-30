-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Disable automatic addition of comments after another
vim.cmd("au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o")

-- Disable lsp formatonsave by default
vim.g.autoformat = false
