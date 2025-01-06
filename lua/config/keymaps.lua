-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<CR>", "m`o<Esc>``")
vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")

vim.keymap.set("n", "<c-p>", "<Plug>(YankyPreviousEntry)")
vim.keymap.set("n", "<c-n>", "<Plug>(YankyNextEntry)")

vim.keymap.set("n", "<leader>os", "<cmd>ObsidianQuickSwitch<cr>")
vim.keymap.set("n", "<leader>on", "<cmd>ObsidianNew<cr>")
vim.keymap.set("n", "<leader>ot", "<cmd>ObsidianToday<cr>")

vim.keymap.set("n", "=", ':lua require("oil").open(vim.fn.getcwd())<CR>', { noremap = true, silent = true })

vim.keymap.set("n", "<leader>SR", function()
  print("Instructions: y = replace, n = skip, a = replace all, q = quit, l = last replace, ^E/^Y = scroll")
  local search = vim.fn.input("Search: ")
  if search == "" then
    print("Search term cannot be empty!")
    return
  end
  local replace = vim.fn.input("Replace with: ")
  vim.cmd(":%s/" .. vim.fn.escape(search, "/") .. "/" .. vim.fn.escape(replace, "/") .. "/gc")
end, { desc = "Search and replace interactively" })

vim.keymap.set("n", "<A-j>", ":Treewalker Down<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-h>", ":Treewalker Left<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-k>", ":Treewalker Up<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-l>", ":Treewalker Right<CR>", { noremap = true, silent = true })

-- Move line down
vim.keymap.set("n", "<C-A-j>", ":m .+1<CR>==", { noremap = true, silent = true })
-- Move line up
vim.keymap.set("n", "<C-A-k>", ":m .-2<CR>==", { noremap = true, silent = true })

-- Visual mode mappings
vim.keymap.set("v", "<C-A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<C-A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>rr", "<cmd>Rest run<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>rl", "<cmd>Rest run last<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>rp", "<cmd>Rest preview<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>aic", "<cmd>CodeCompanionChat<cr>", { desc = "Chat with AI", silent = true })
vim.keymap.set("n", "<leader>aii", "<cmd>CodeCompanion<cr>", { desc = "Inline AI Assist", silent = true })
