return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
    'nvim-telescope/telescope.nvim',
  },
  lazy = false,
  keys = {
    { '<leader>g', '<cmd>Neogit<CR>', mode = 'n', desc = 'Neo[g]it' },
  },
  opts = {
    disable_line_numbers = false,
    disable_relative_line_numbers = false,
    integration = {
      -- Neogit only provides inline diffs. If you want a more traditional way
      -- to look at diffs, you can use `diffview`. The diffview integration
      -- enables the diff popup.
      diffview = true,
    },
    process_spinner = true,
    -- Value used for `--sort` option for `git branch` command
    -- By default, branches will be sorted by commit date descending
    -- Flag description: https://git-scm.com/docs/git-branch#Documentation/git-branch.txt---sortltkeygt
    -- Sorting keys: https://git-scm.com/docs/git-for-each-ref#_options
    sort_branches = '-committerdate',
  },
}
