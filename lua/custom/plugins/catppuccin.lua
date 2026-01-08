-- See https://github.com/catppuccin/nvim
return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function()
    require('catppuccin').setup {
      auto_integrations = true,
      --- @diagnostic disable-next-line: missing-fields
      dim_inactive = {
        enable = true,
      },
      no_italic = true,
      term_color = false,
    }
    vim.cmd.colorscheme 'catppuccin-macchiato'
  end,
}
