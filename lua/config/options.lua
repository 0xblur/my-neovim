-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.mapleader = " "
vim.g.maplocalleader = " "
local opt = vim.opt

opt.timeoutlen = 300 -- which-key display duration
opt.termguicolors = true -- True color support
opt.number = true
