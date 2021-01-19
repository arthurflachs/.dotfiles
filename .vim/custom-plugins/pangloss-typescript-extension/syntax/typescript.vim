" Import pangloss
" TODO check how to create dependencies
runtime! syntax/typescript-pangloss-copy.vim

syntax keyword typescriptInterfaceKeyword interface nextgroup=typescriptInterfaceName skipwhite

high link typescriptInterfaceKeyword Keyword
high link typescriptInterfaceName    Function

syntax match typescriptGenericFnCall /\v[a-zA-Z].*/
high link typescriptGenericFnCall    Todo
