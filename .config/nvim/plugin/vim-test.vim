" make test commands execute using dispatch.vim
if has('nvim')
  let test#strategy = "dispatch"
else
  let test#strategy = "vimterminal"
endif

" Python
let test#python#runner = "nose"
let test#python#nose#options = "--nologcapture"

let g:dispatch_compilers = {}
let g:dispatch_compilers['nosetests --doctest-tests --nologcapture'] = 'pyunit'
