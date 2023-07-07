-- Options are standard vim configuration and keymaps that doesn't require any plugin to provide their functionality.
-- Options are automatically loaded before lazy.nvim plugin manager.
--
-- <leader> key is changed from "\" to " " (<space>).
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- Open netrw file explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
local opt = vim.opt

opt.clipboard = "unnamedplus" -- Sync with system clipboard
opt.undolevels = 10000 -- Almost infinite undo's
opt.undofile = true
-- Tab/indent settings
opt.tabstop = 2 -- # of spaces for a tab count
opt.softtabstop = 2
opt.shiftround = true -- Round indents
opt.shiftwidth = 2
opt.expandtab = true

opt.timeoutlen = 300 -- which-key display duration

opt.termguicolors = true -- True color support
opt.cursorline = true -- Enable highlighting of the current line

opt.number = true

-- Python 3.11 as provider
vim.cmd.let "g:python3_host_prog = '/usr/bin/python3.11'"

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
