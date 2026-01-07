return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  -- FIXME: `main` does not work
  -- main = 'nvim-treesitter.configs', -- Sets main module to use for opts
  -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
  opts = {
    ensure_installed = {
      'astro',
      'bash',
      'c',
      'css',
      'diff',
      'editorconfig',
      'git_config',
      'git_rebase',
      'gitattributes',
      'gitcommit',
      'gitignore',
      'go',
      'goctl',
      'godot_resource',
      'gomod',
      'gosum',
      'gotmpl',
      'groovy',
      'haskell',
      'html',
      'javascript',
      'just',
      'lua',
      'luadoc',
      'markdown',
      'markdown_inline',
      'nix',
      'python',
      'query',
      'regex',
      'sql',
      'tsx',
      'typescript',
      'vim',
      'vimdoc',
    },
    auto_install = true,
    highlight = {
      enable = true,
      -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
      --  If you are experiencing weird indenting issues, add the language to
      --  the list of additional_vim_regex_highlighting and disabled languages for indent.
      additional_vim_regex_highlighting = { 'ruby' },
    },
    indent = { enable = true, disable = { 'ruby' } },
  },
  -- Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
  -- Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects

  -- Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
  {
    'nvim-treesitter/nvim-treesitter-context',
    dependencies = {
      { 'nvim-treesitter/nvim-treesitter' },
    },
    keys = {
      {
        ']c',
        function()
          require('treesitter-context').go_to_context(vim.v.count1)
        end,
        desc = 'Jump to the [c]ontext',
      },
    },
    opts = {},
  },
}
