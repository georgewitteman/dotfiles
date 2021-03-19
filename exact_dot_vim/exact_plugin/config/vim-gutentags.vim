" Don't add tags file to home directory
let g:gutentags_exclude_project_root = ['/usr/local', $HOME]

if executable('project-find')
  let g:gutentags_file_list_command = 'project-find'
endif
