-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

local map_buffer = function(keys, func, desc, mode)
  mode = mode or { 'n', 'v' }
  vim.keymap.set(mode, keys, func, { desc = '[B]uffer: ' .. desc })
end

local del_current_bufs = function(callback)
  local current_buf = vim.api.nvim_get_current_buf()
  local bufs = vim.api.nvim_list_bufs()
  for _, idx in ipairs(bufs) do
    if idx == current_buf then
      vim.api.nvim_set_current_buf(bufs[#bufs])
      callback(current_buf)
      break
    end
  end
end

map_buffer('<leader>bd', function()
  del_current_bufs(function(current_buf)
    vim.api.nvim_buf_delete(current_buf, { force = false, unload = false })
  end)
end, '[d]elete [c]urrent')

map_buffer('<leader>bD', function()
  del_current_bufs(function(current_buf)
    vim.api.nvim_buf_delete(current_buf, { force = true, unload = false })
  end)
end, '[D]elete [c]urrent force')

map_buffer('<leader>bo', function()
  local current = vim.api.nvim_get_current_buf()
  for _, idx in ipairs(vim.api.nvim_list_bufs()) do
    if idx ~= current then
      vim.api.nvim_buf_delete(idx, { force = false, unload = false })
    end
  end
end, '[D]elete [o]thers')

vim.keymap.set('n', '<leader>e', '<cmd>mks!<CR><cmd>qa<CR>', { desc = '[E]xit all and save session' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set({ 'n', 'v' }, '<leader>r', function()
  local ok = pcall(vim.treesitter.start)
  if ok then
    vim.print 'Treesitter reloaded!'
  end
end, { desc = '[r]eload plugins: Treesitter' })

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Terminal mode
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<C-x>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })
