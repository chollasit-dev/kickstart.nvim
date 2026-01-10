-- See: https://github.com/NickvanDyke/opencode.nvim
return {
  'NickvanDyke/opencode.nvim',
  config = function()
    ---@type opencode.Opts
    vim.g.opencode_opts = {
      -- Your configuration, if any — see `lua/opencode/config.lua`, or "goto definition".
    }

    -- Required for `opts.events.reload`
    vim.o.autoread = true

    local opencode = require 'opencode'
    local desc_prefix = '[O]penCode: '

    local map = function(keys, func, desc, mode)
      mode = mode or 'n'
      vim.keymap.set(mode, keys, func, { desc = desc_prefix .. desc })
    end
    map('<leader>oa', function()
      opencode.ask('@this: ', { submit = true })
    end, '[a]sk', { 'n', 'x' })
    map('<leader>oe', opencode.select, '[e]xecute action...', { 'n', 'x' })
    map('<leader>o.', opencode.toggle, '[t]oggle OpenCode', { 'n', 't' })

    vim.keymap.set({ 'n', 'x' }, '<leader>og', function()
      return opencode.operator '@this '
    end, { expr = true, desc = desc_prefix .. 'Add range to opencode' })
    vim.keymap.set('n', '<leader>oG', function()
      return opencode.operator '@this ' .. '_'
    end, { expr = true, desc = 'Add line to opencode' })
  end,
}
