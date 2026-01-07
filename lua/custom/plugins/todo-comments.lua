return {
  'folke/todo-comments.nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    vim.keymap.del('n', '[t')
    vim.keymap.del('n', ']t')

    local map = function(keys, func, desc, mode)
      mode = mode or 'n'
      vim.keymap.set(mode, keys, func, { desc = desc })
    end

    local todo = require 'todo-comments'
    todo.setup {
      signs = false,
    }

    map('[t', function()
      todo.jump_prev()
    end, 'Jump to the previous [t]odo in the current buffer')
    map(']t', function()
      todo.jump_next()
    end, 'Jump to the next [t]odo in the current buffer')
    map('[T', function()
      todo.jump_prev { keywords = { 'TODO' } }
    end, 'Jump to the previous [T]ODO keyword in the current buffer')
    map(']T', function()
      todo.jump_next { keywords = { 'TODO' } }
    end, 'Jump to the next [T]ODO keyword in the current buffer')
  end,
}
