-- See https://github.com/rose-pine/neovim
return {
  'rose-pine/neovim',
  name = 'rose-pine',
  priority = 1000,
  enabled = false,
  config = function()
    require('rose-pine').setup {
      dim_inactive_windows = true,
      extend_background_behind_borders = false,
      styles = {
        italic = false,
      },
    }
    vim.cmd.colorscheme 'rose-pine-moon'
  end,
}
