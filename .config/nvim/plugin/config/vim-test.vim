" make test commands execute using dispatch.vim
let test#strategy = 'dispatch'

" Python
let test#python#runner = 'nose'
let test#python#nose#options = '--nologcapture'

let g:dispatch_compilers = {}
let g:dispatch_compilers['nosetests --doctest-tests --nologcapture'] = 'pyunit'
