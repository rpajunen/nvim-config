local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- import/override with your plugins
    { import = "plugins" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  -- install = { colorscheme = { "habamax", "folke/tokyonight" } },
  lsp = {
    formatting = {
      filter = function(client, bufnr)
        local ft = vim.api.nvim_buf_get_option(bufnr, "filetype")
        -- Disable formatting for Solidity
        if ft == "solidity" then
          return false
        end
        return true -- Enable formatting for other file types
      end,
    },
  },
  checker = {
    enabled = true, -- check for plugin updates periodically
    notify = false, -- notify on update
  }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

require("lspconfig").efm.setup({
  filetypes = { "solidity" },
  settings = {
    languages = {
      solidity = {
        { -- solidity could have more than one linter, hence this nesting.
          lintStdin = true, -- pipe buffer content to solhint
          lintIgnoreExitCode = true, -- because exit code 1 is common
          lintCommand = "solhint stdin", -- default format stylish
          lintFormats = {
            " %#%l:%c %#%tarning %#%m",
            " %#%l:%c %#%trror %#%m", -- solhint only has error and warn
          },
          lintSource = "solhint",
        },
      },
    },
  },
})
