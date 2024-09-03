return {
  "aliqyan-21/wit.nvim",
  config = function()
    require("wit").setup({
      search_engine = "google",
    })

    vim.keymap.set("n", "<leader>si", function()
      local search_query = vim.fn.input("WitSearch: ")

      if search_query ~= "" then
        vim.cmd("WitSearch " .. search_query)
      end
    end, { noremap = true, silent = true })
  end,
}
