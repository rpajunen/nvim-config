return {
  "nvim-neorg/neorg",
  lazy = false,
  version = "*",
  config = function()
    require("neorg").setup({
      load = {
        ["core.defaults"] = {},
        ["core.dirman"] = {
          config = {
            workspaces = {
              strgl = "~/neorg/strgl/",
              roope = "~/neorg/roope/",
            },
          },
        },
        ["core.concealer"] = {
          config = {
            icon_preset = "varied",
          },
        },
      },
    })
  end,
}
