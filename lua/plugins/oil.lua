function _G.get_oil_winbar()
  local dir = require("oil").get_current_dir()
  if dir then
    return vim.fn.fnamemodify(dir, ":~")
  else
    -- If there is no current directory (e.g. over ssh), just show the buffer name
    return vim.api.nvim_buf_get_name(0)
  end
end

return {
  "stevearc/oil.nvim",
  opts = {},
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  config = function()
    require("oil").setup({
      win_options = {
        winbar = "%!v:lua.get_oil_winbar()",
      },
      default_file_explorer = true,
      keymaps = {
        ["<Esc>"] = "actions.close",
        ["_"] = "actions.open_cwd",
        ["<C-s>"] = function()
          vim.cmd(":w")
        end,
      },
    })
  end,
  keys = {
    { "=", "<cmd>Oil<cr>", mode = "n", desc = "Open Filesystem" },
    { "-", "<cmd>Oil<cr>", mode = "n", desc = "Open Filesystem" },
  },
}
