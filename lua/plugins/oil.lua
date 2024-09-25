return {
  "stevearc/oil.nvim",
  opts = {},
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup({ default_file_explorer = true, keymaps = { ["<Esc>"] = "actions.close" } })
  end,
  keys = {
    { "=", "<cmd>Oil<cr>", mode = "n", desc = "Open Filesystem" },
    { "-", "<cmd>Oil --float<cr>", mode = "n", desc = "Open Floating Filesystem" },
  },
}
