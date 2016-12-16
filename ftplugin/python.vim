setlocal noexpandtab
setlocal tabstop=4
setlocal shiftwidth=4

highlight Excess ctermbg=DarkGrey guibg=Black
match Excess /\%80v.*/

let g:pymode_folding = 0

let g:pymode_rope_show_doc_bind = ''

setlocal completeopt-=preview
