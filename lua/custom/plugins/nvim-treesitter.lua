local ensure_installed = {
  'astro',
  'awk',
  'bash',
  'blade',
  'c',
  'c_sharp',
  'caddy',
  'css',
  'csv',
  'dart',
  'diff',
  'dockerfile',
  'editorconfig',
  'elixir',
  'fsharp',
  'git_config',
  'git_rebase',
  'gitattributes',
  'gitcommit',
  'gitignore',
  'gleam',
  'go',
  'goctl',
  'godot_resource',
  'gomod',
  'gosum',
  'gotmpl',
  'gowork',
  'gpg',
  'graphql',
  'groovy',
  'haskell',
  'hcl',
  'helm',
  'html',
  'html_tags',
  'htmldjango',
  'hyprlang',
  'ini',
  'java',
  'javadoc',
  'javascript',
  'jinja_inline',
  'jq',
  'jsdoc',
  'json5',
  'jsx',
  'just',
  'kitty',
  'kotlin',
  'latex',
  'ledger',
  'lua',
  'luadoc',
  'luau',
  'make',
  'markdown',
  'markdown_inline',
  'mermaid',
  'nginx',
  'ninja',
  'nix',
  'ocaml',
  'ocaml_interface',
  'ocamllex',
  'passwd',
  'pem',
  'php',
  'php_only',
  'phpdoc',
  'printf',
  'prisma',
  'prolog',
  'proto',
  'python',
  'query',
  'razor',
  'regex',
  'robot',
  'rst',
  'rust',
  'scala',
  'scss',
  'solidity',
  'sproto',
  'sql',
  'ssh_config',
  'svelte',
  'swift',
  'templ',
  'terraform',
  'textproto',
  'tmux',
  'toml',
  'tsv',
  'tsx',
  'typescript',
  'typst',
  'vim',
  'vimdoc',
  'vue',
  'xml',
  'zig',
  'zsh',
}

require('nvim-treesitter').install(ensure_installed) -- Only install non-exist parsers

return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate', -- Does not support lazy-loading
  main = 'nvim-treesitter.config', -- Sets main module to use for opts
  config = function()
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    local treesitter = require 'nvim-treesitter'
    treesitter.setup {
      -- FIXME: Unable to auto-install declaratively
      -- See install line above before module return
      ensure_installed = ensure_installed,
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    }

    -- [[ Additional Functionalities ]]
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { '*' },
      callback = function()
        --   - Highlight https://github.com/nvim-treesitter/nvim-treesitter#highlighting
        vim.treesitter.start()
        --   - Fold https://github.com/nvim-treesitter/nvim-treesitter#folds
        vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.wo[0][0].foldmethod = 'expr'
        -- Indentation https://github.com/nvim-treesitter/nvim-treesitter#indentation
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })

    -- Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    -- Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  end,

  -- Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
  {
    'nvim-treesitter/nvim-treesitter-context',
    dependencies = {
      { 'nvim-treesitter/nvim-treesitter' },
    },
    lazy = false,
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
