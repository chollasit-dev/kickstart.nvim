-- See https://github.com/hedyhli/outline.nvim
return {
  'hedyhli/outline.nvim',
  lazy = true,
  keys = {
    {
      '<leader>O',
      function()
        local outline = require 'outline'
        -- TODO: Find a way to pass more options: window size, etc.
        outline.toggle()
      end,
      desc = '[O]utline: toggle',
    },
  },
  opts = {
    outline_items = {
      show_symbol_lineno = true,
    },
  },
}
