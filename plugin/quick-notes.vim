if exists("g:loaded_quick_notes")
    finish
endif
let g:loaded_quick_notes = 1

let s:old_cpo = &cpo
set cpo&vim

let g:quick_notes_directory = '~/.cache/quick-notes/'
let g:quick_notes_directory_notes = g:quick_notes_directory . 'notes/'
let g:quick_notes_directory_diary = g:quick_notes_directory . 'diary/'
let g:quick_notes_suffix = 'md'

call quick_notes#initialize()

function! QuickNotesNew()
  call quick_notes#new()
endfunction

function! QuickNotesNewDiary()
  call quick_notes#new_diary()
endfunction

function! QuickNotesLsNotes()
  call quick_notes#ls_notes()
endfunction

function! QuickNotesLsDiary()
  call quick_notes#ls_diary()
endfunction

let &cpo = s:old_cpo
unlet s:old_cpo
