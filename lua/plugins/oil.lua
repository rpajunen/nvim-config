return {
  "stevearc/oil.nvim",
  opts = {},
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  config = function()
    require("oil").setup({
      win_options = {
        signcolumn = "yes:1",
      },
      default_file_explorer = false,
      keymaps = {
        ["<Esc>"] = "actions.close",
        ["<C-s>"] = function()
          vim.cmd(":w")
        end,
      },
    })
  end,
  keys = {
    { "=", "<cmd>Oil<cr>", mode = "n", desc = "Open Filesystem" },
    { "-", "<cmd>Oil --float<cr>", mode = "n", desc = "Open Floating Filesystem" },
  },
}
