-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<CR>", "m`o<Esc>``")
-- vim.keymap.set("n", "<leader>tt", ":ToggleTerm<CR>", { noremap = true, silent = true })
-- vim.keymap.set("n", "<leader>tn", ":lua open_terminal_in_cwd()<CR>", { noremap = true, silent = true })
