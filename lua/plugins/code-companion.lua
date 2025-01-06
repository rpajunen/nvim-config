return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "hrsh7th/nvim-cmp", -- Optional: For using slash commands and variables in the chat buffer
      "nvim-telescope/telescope.nvim", -- Optional: For using slash commands
      { "MeanderingProgrammer/render-markdown.nvim", ft = { "markdown", "codecompanion" } }, -- Optional: For prettier markdown rendering
      { "stevearc/dressing.nvim", opts = {} }, -- Optional: Improves `vim.ui.select`
    },
    config = function()
      require("codecompanion").setup({
        strategies = {
          chat = {
            adapter = "gemini", -- Set Gemini as the chat adapter
          },
          inline = {
            adapter = "gemini", -- Set Gemini as the inline adapter
          },
        },
        adapters = {
          gemini = function()
            return require("codecompanion.adapters").extend("gemini", {
              env = {
                api_key = "" or "", -- Store the API key as an environment variable
              },
              model = "gemini-1.5-pro", -- Use the latest Gemini model
            })
          end,
        },
        display = {
          diff = {
            provider = "mini_diff",
          },
        }, -- display = {
        --   action_palette = {
        --     provider = "telescope",
        --   },
        -- },
      })
    end,
  },
}
