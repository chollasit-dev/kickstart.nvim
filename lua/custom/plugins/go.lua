return {
  'ray-x/go.nvim',
  event = { 'CmdlineEnter' },
  build = function()
    require('go.install').update_all_sync()
  end,
  dependencies = {
    'neovim/nvim-lspconfig',
    'nvim-treesitter/nvim-treesitter',
    -- 'ray-x/guihua.lua', -- Optional for floating test terminal
  },
  ft = { 'go', 'gomod' },
  opts = {},
}
