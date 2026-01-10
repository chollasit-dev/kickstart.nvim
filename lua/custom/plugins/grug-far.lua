-- See: https://github.com/MagicDuck/grug-far.nvim
---@type LazySpec
return {
  'MagicDuck/grug-far.nvim',
  dependencies = {
    { 'BurntSushi/ripgrep' },
  },
  -- Alternatively, you can set options with `vim.g.grug_far = { ... }`
  opts = {},
}
