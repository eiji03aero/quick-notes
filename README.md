# quick-notes
- Simple solution for access/creation for notes.

## Usage
```vim
" Create new note. Will be prompted to input file name.
" Path can contain / to create file under directories.
:call QuickNotesNew()

" Create new note named with current date
:call QuickNotesNewDiary()

" Open notes directory.
:call QuickNotesLsNotes()

" Open diaries directory.
:call QuickNotesLsDiary()

" Open notes in fzf.
" Needs fzf and fzf.vim
:call QuickNotesFzf()
```

## Configuration
```vim
" directory to locate notes and diaries.
let g:quick_notes_directory = '~/.cache/quick-notes/'

" suffix used for diaries
let g:quick_notes_suffix = 'md'
```

## Todo
- none
