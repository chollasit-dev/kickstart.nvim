return {
  'numToStr/FTerm.nvim',
  config = function()
    local fterm = require 'FTerm'
    --- @diagnostic disable-next-line: missing-fields
    fterm.setup {
      --- @diagnostic disable-next-line: missing-fields
      dimensions = {
        height = 0.9,
        width = 0.9,
      },
      --- See `:h jobstart-options`
      --- @type table<string,string>|nil
      env = nil,
    }
    vim.keymap.set({ 'n', 't' }, '<M-i>', function()
      fterm.toggle()
    end)
  end,
}
