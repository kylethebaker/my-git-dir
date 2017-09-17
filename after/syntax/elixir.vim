" Add inline keyword highlighting for do|else so that single line defs and ifs
" are prettier
syn match elixirBlockInline "\<\(do\|else\)\>:\@="
hi def link elixirBlockInline Keyword
