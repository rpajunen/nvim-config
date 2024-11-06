return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = false,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("obsidian").setup({
      workspaces = {
        {
          name = "ObsidianVault",
          path = "~/Documents/Obsidian notes",
        },
      },
      completion = {
        nvim_cmp = true,
        min_chars = 2,
      },
      new_notes_location = "notes_subdir",
      note_id_func = function(title)
        return title
      end,
      note_frontmatter_func = function(note)
        local out = { id = note.id, aliases = note.aliases, tags = note.tags }

        if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
          for k, v in pairs(note.metadata) do
            out[k] = v
          end
        end

        return out
      end,
      mappings = {},
      keys = {
        { "<leader>os", "ObsidianQuickSwitch", mode = "n", desc = "Open Obsidian quick switch" },
        -- { "-", "<cmd>Oil --float<cr>", mode = "n", desc = "Open Floating Filesystem" },
      },
      ui = {
        enable = true, -- using render-markdown.nvim instead
      },
    })
  end,
}
