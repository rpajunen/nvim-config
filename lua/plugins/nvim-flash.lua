return {
  "folke/flash.nvim",
  config = function()
    require("flash").setup({})

    -- TokyoNight-inspired highlight groups
    vim.api.nvim_set_hl(0, "FlashMatch", { bg = "#7aa2f7", fg = "#1a1b26", bold = true }) -- Blue with dark background
    vim.api.nvim_set_hl(0, "FlashCurrent", { bg = "#f7768e", fg = "#1a1b26", bold = true }) -- Pink-red with dark background
    vim.api.nvim_set_hl(0, "FlashBackdrop", { bg = "#1a1b26", fg = "#565f89", italic = true }) -- Dark with gray text

    -- For the character indicating where to move
    vim.api.nvim_set_hl(0, "FlashLabel", { bg = "#1a1b26", fg = "#bb9af7", bold = true, underline = true }) -- Purple with dark background
  end,
}
