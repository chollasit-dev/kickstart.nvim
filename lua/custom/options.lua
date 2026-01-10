-- [[ Setting options ]]
-- See `:help vim.o`
-- and `:help option-list`

vim.o.autoindent = true
vim.o.autoread = true
vim.o.backup = false
vim.o.breakindent = true
vim.o.colorcolumn = '80'
vim.o.cursorline = true
vim.o.cursorlineopt = 'both'
vim.o.mouse = 'a'
vim.o.number = true
vim.o.relativenumber = true
vim.o.scrollbind = false -- Set to `true` useful for comparing diff
vim.o.scrolljump = -20
vim.o.scrolloff = 0
vim.o.showmode = false
vim.o.signcolumn = 'yes'
vim.o.smartindent = true
vim.o.softtabstop = -1 -- Follow `shiftwidth`
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.swapfile = false
vim.o.timeoutlen = 300
vim.o.undodir = os.getenv 'HOME' .. '/.vim/undodir' -- TODO: recheck what is this
vim.o.undofile = true
vim.o.updatetime = 250
vim.o.virtualedit = 'all'
vim.o.winborder = 'single'

-- Case-insensitive searching UNLESS <search_term>\C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Preview substitutions live, as you type!
-- See `:help substitute`
vim.o.inccommand = 'split'

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  TODO: See `:help 'clipboard'`
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
-- Notice listchars is set using `vim.opt` instead of `vim.o`.
-- It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--  See `:help lua-options`
--  and `:help lua-options-guide`
vim.o.list = true
vim.opt.listchars = { extends = '+', nbsp = '␣', space = '·', tab = '» ' }
