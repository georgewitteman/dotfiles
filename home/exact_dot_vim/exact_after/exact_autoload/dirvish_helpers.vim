function! dirvish_helpers#delete(delflags, refresh)
  " Without the trailing slash directories get, so that a symlink to a directory
  " is deleted itself. With it, delete() empties the directory it points to.
  let path = substitute(getline('.'), '/$', '', '')
  let type = getftype(path)
  if type ==# ''
    echo 'Not a file or directory.'
    return
  endif

  let choice = confirm('Delete '.path.'?', "&Yes\n&No", 2)
  if choice !=# 1
    return
  endif

  if type ==# 'dir'
    let result = delete(path, a:delflags)
  else
    let result = delete(path)
  endif

  if result !=# 0
    echo 'Deletion failed!'
  endif

  if a:refresh ==# 1
    execute 'Dirvish %'
  endif
endfunction

function! dirvish_helpers#make_directory()
  call inputsave()
  let newdirname= input('Please give directory name: ')
  call inputrestore()
  if newdirname ==# ''
   return
  endif

  let fullnewdir= expand('%') . newdirname
  if isdirectory(fullnewdir)
    redraw " Clear the input line
    echo fullnewdir.' already exists'
    return
  endif

  call mkdir(fullnewdir, 'p')

  execute 'Dirvish %'

  call search('\V' . escape(newdirname, '\') . '/', 'w')
endfunction

function! dirvish_helpers#make_file()
  call inputsave()
  let newfilename = input('Enter filename: ')
  call inputrestore()
  if newfilename ==# ''
   return
  endif

  let fullfilename = expand('%') . newfilename
  if filereadable(fullfilename)
    redraw " Clear the input line
    echo fullfilename .' already exists'
    return
  endif

  execute 'e '.fnameescape(fullfilename)
endfunction

function! dirvish_helpers#move()
  " Without the trailing slash, so that a symlink to a directory is renamed
  " itself. With it, rename() moves the directory it points to.
  let path = substitute(getline('.'), '/$', '', '')
  if getftype(path) ==# ''
    echo 'Path does not exist.'
    return
  endif

  call inputsave()
  let newpath = input('Enter new path: ', path)
  call inputrestore()

  if newpath ==# '' || newpath ==# path
    return
  endif
  if rename(path, newpath) !=# 0
    echo 'Rename failed!'
  endif

  execute 'Dirvish %'
endfunction
