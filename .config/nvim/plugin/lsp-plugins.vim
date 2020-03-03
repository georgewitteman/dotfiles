au User lsp_setup call lsp#register_server({
  \ 'name': 'pyls',
  \ 'cmd': {server_info->[&shell, &shellcmdflag, '~/.config/nvim/python3-venv/bin/pyls']},
  \ 'whitelist': ['python'],
  \ 'workspace_config': {'pyls': {'configurationSources': ['flake8'] }}
  \ })
