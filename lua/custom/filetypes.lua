-- [[ Additional filetype supports ]]

vim.filetype.add {
  filename = {
    ['Caddyfile'] = 'caddy',
  },
  pattern = {
    ['Caddyfile%..*'] = 'caddy', -- Caddyfile.dev, etc.
  },
}
