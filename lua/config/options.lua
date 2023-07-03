-- Options are standard vim configuration and keymaps that doesn't require any plugin to provide their functionality.
-- Options are automatically loaded before lazy.nvim plugin manager.
--
-- <leader> key is changed from "\" to " " (<space>).
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- Open netrw file explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
local opt = vim.opt

opt.timeoutlen = 300 -- which-key display duration
opt.termguicolors = true -- True color support
opt.number = true
