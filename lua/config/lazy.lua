-- Bootstrap lazy.nvim
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

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.relativenumber = true
-- To display line numbers along the left side of a window
vim.opt.number = true
-- Enable relative line numbers
vim.opt.relativenumber = true
-- Add mouse support (scrolling, copy)
vim.opt.mouse = 'a'
-- Enable always display the status line
vim.opt.laststatus = 2
-- Always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appear/become resolved.
vim.opt.signcolumn = "yes"
-- Ignore node_modules and package-lock.json files
vim.opt.wildignore:append({ "*/node_modules/*", "package-lock.json" })
-- Append 'c' to the shortmess setting for cruncify
vim.opt.shortmess:append("c")
-- Enable termguicolors for colorschemes that support it
vim.opt.termguicolors = true
-- Set t_Co=256 (color mode)
vim.opt.t_Co = 256
-- Turn on syntax highlighting
vim.cmd('syntax on')
-- Append path to subfolders
vim.opt.path:append("**")
-- Display all matching files when tab complete
vim.opt.wildmenu = true
-- Stop highlighting all matches to a search
vim.opt.hlsearch = false

vim.opt.cmdheight = 2
vim.opt.encoding = "utf-8"
vim.opt.hidden = true

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = false },
})
