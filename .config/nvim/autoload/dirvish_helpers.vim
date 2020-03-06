function! dirvish_helpers#delete(delflags, refresh)
  let path = getline('.')
  if !isdirectory(path) && !filereadable(path)
    echo 'Not a file or directory.'
    return
  endif

  let choice = confirm('Delete '.path.'?', "&Yes\n&No", 2)
  if choice !=# 1
    return
  endif

  if isdirectory(path)
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

  call mkdir(fullnewdir)

  execute 'Dirvish %'

  call search(newdirname.'/', 'w')
endfunction

function! dirvish_helpers#make_file()
  call inputsave()
  let newfilename = input('Enter filename: ')
  call inputrestore()
  if newfilename ==# ''
   return
  endif

  let fullfilename = expand('%') . fnameescape(newfilename)
  if filereadable(fullfilename)
    redraw " Clear the input line
    echo fullfilename .' already exists'
    return
  endif

  execute 'e '.fullfilename
endfunction

function! dirvish_helpers#move_file()
  let path = getline('.')
  if !filereadable(path)
    echo 'Not a file.'
    return
  endif

  call inputsave()
  let newpath = input('Enter new path: ', path)
  call inputrestore()

  call system('mv ' . path . ' ' . newpath)

  execute 'Dirvish %'
endfunction
