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

function! quick_notes#new() abort
  let title = input("Input the title: ")
  let filename = g:quick_notes_directory_notes . title . "." . g:quick_notes_suffix
  execute "edit " . filename
endfunction

function! quick_notes#new_diary() abort
  let date = strftime('%Y-%m-%d')
  let filename = g:quick_notes_directory_diary . date . "." . g:quick_notes_suffix
  execute "edit " . filename
endfunction

function! quick_notes#ls_notes() abort
  execute "edit " . g:quick_notes_directory_notes
endfunction

function! quick_notes#ls_diary() abort
  execute "edit " . g:quick_notes_directory_diary
endfunction

function! quick_notes#fzf() abort
  let dirpath = fnamemodify(g:quick_notes_directory, ":p")
  exec "Files ".dirpath
endfunction

" SECTION: Private methods {{{1
"============================================================
function! quick_notes#createDirectory(path) abort
  let fullpath = fnamemodify(a:path, ':p')

  if !isdirectory(fullpath)
    mkdir(fullpath, 'p')
  endif
endfunction
