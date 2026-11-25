if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect
  autocmd! BufNewFile,BufRead devcontainer.json setfiletype jsonc

  " chezmoi templates: detect the filetype from the name without .tmpl, like
  " foo.sh.tmpl as sh, instead of Vim's HTML-based template filetype. The git
  " config's name doesn't say what it is, so it gets its own rule.
  autocmd BufNewFile,BufRead */exact_git/private_config.tmpl setfiletype gitconfig
  autocmd BufNewFile,BufRead *.tmpl execute 'doautocmd filetypedetect BufRead' fnameescape(expand('<amatch>:r'))
augroup END
