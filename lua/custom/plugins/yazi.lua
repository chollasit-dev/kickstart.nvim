local desc_prefix = '[Y]azi: '

-- See: https://github.com/mikavilpas/yazi.nvim
--
-- Note Keymaps
-- - grep_in_directory = "<c-s>",
-- - replace_in_directory = "<c-g>"
-- - cycle_open_buffers = "<tab>"
-- - copy_relative_path_to_selected_files = "<c-y>"

--- @type LazySpec
return {
  'mikavilpas/yazi.nvim',
  version = '*', -- Use the latest stable version
  event = 'VeryLazy',
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
  },
  keys = {
    {
      '<leader>yf',
      mode = { 'n', 'v' },
      '<cmd>Yazi<CR>',
      desc = desc_prefix .. 'Open at current file',
    },
    {
      '<leader>yw',
      '<cmd>Yazi cwd<CR>',
      desc = desc_prefix .. 'Open at the current working directory',
    },
    {
      '<leader>yr',
      '<cmd>Yazi toggle<CR>',
      desc = desc_prefix .. '[r]esume the last session',
    },
  },
  ---@diagnostic disable-next-line: undefined-doc-name
  ---@type YaziConfig | {}
  opts = {
    -- Recommend if replace Netrw with Yazi
    open_for_directories = true,
    keymaps = {
      show_help = '<F1>',
    },
  },
  -- Recommend for `open_for_directories=true`
  init = function()
    -- Mark Netrw as loaded so it's not loaded at all
    -- Required if Netrw is not disabled
    --
    -- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
    -- vim.g.loaded_netrwPlugin = 1
  end,
}
