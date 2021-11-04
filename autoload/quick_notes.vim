if exists("g:loaded_quick_notes_autoload")
    finish
endif
let g:loaded_quick_notes_autoload = 1

" SECTION: Public methods {{{1
"============================================================
function! quick_notes#initialize() abort
  call quick_notes#createDirectory(g:quick_notes_directory)
  call quick_notes#createDirectory(g:quick_notes_directory_diary)
  call quick_notes#createDirectory(g:quick_notes_directory_notes)
endfunction

function! quick_notes#start_edit(path) abort
  call quick_notes#ensureDirectoryExists(a:path)
  execute "edit " . a:path
endfunction

function! quick_notes#new() abort
  let path = input("Input the title: ", g:quick_notes_directory_notes, "file")
  call quick_notes#start_edit(path)
endfunction

function! quick_notes#new_diary() abort
  let date = strftime('%Y-%m-%d')
  let path = g:quick_notes_directory_diary . date . "." . g:quick_notes_suffix
  call quick_notes#start_edit(path)
endfunction

function! quick_notes#ls_notes() abort
  call quick_notes#start_edit(g:quick_notes_directory_notes)
endfunction

function! quick_notes#ls_diary() abort
  call quick_notes#start_edit(g:quick_notes_directory_diary)
endfunction

function! quick_notes#fzf() abort
  let dirpath = fnamemodify(g:quick_notes_directory, ":p")
  exec "Files " . dirpath
endfunction

" SECTION: Private methods {{{1
"============================================================
function! quick_notes#createDirectory(path) abort
  let fullpath = fnamemodify(a:path, ':p')

  if !isdirectory(fullpath)
    call mkdir(fullpath, 'p')
  endif
endfunction

function! quick_notes#ensureDirectoryExists(path) abort
  let parentDirectory = fnamemodify(a:path, ':p:h')
  call quick_notes#createDirectory(parentDirectory)
endfunction
