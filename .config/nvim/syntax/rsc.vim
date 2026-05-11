" Vim syntax file
" Language:   RouterOS script
" Maintainer: Krzysztof Cieslak
" Repository: https://github.com/krcs/vim-routeros-syntax
" License:    Vim

if exists("b:current_syntax")
  finish
endif

syn case ignore

"
" Comments:
"
syn match rosComment "^#.*$"

"
" Global Commands:
"
syn match rosGlobalCommand ":\(global\|local\|beep\|delay\|put\|len\|typeof\)"
syn match rosGlobalCommand ":\(pick\|log\|time\|set\|find\|environment\)"
syn match rosGlobalCommand ":\(terminal\|error\|execute\|parse\|resolve\)"
syn match rosGlobalCommand ":\(toarray\|tobool\|toid\|toip\|toip6\|tonum\)"
syn match rosGlobalCommand ":\(tostr\|totime\)"

"
" Common Command:
"
syn keyword rosCommonCommand add remove enable disable set get print export
\ edit find

"
" Parameters:
"
syn keyword rosParameter append brief detail file follow interval terse where
syn match rosParameter 
\ "\(count-only\|as-value\|follow-only\|value-list\|without-paging\)"
syn match rosParameter "on-error\ze="
syn match rosParameter "\w\+\ze="

"
" Loops:
"
syn match rosLoop ":\(do\|while\|foreach\|for\)"
syn match rosLoop "\(while\|from\|to\|step\|do\|in\)\ze="

"
" Variables:
"
syn match rosVariable "\(:\(local\|global\|set\|foreach\|for\)\s\+\)\@<=\w\+"
syn match rosVariable "\$\w\+"

"
" Conditional Statement:
"
syn match rosConditional ":if"

"
" Data Types:
"
syn keyword rosDataType num bool str ip ip-prefix ip6 ip6-prefix id time array
\ nil

"
" Other Keywords:
"
syn keyword rosKeyword true false and or in

"
" Operators:
"
syn match rosOperator "\~"
syn match rosOperator "->"

"
" String:
"
syn region rosString start=+"+ skip=+"\zs"\|\\"+ end=+"+

"
" Numbers:
"
syn match rosNumber "[+-]\=\d\+\(ms\)\="

"-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
hi def link rosGlobalCommand   Statement
hi def link rosCommonCommand   Statement
hi def link rosLoop            Repeat
hi def link rosComment         Comment
hi def link rosConditional     Conditional
hi def link rosDataType        Type
hi def link rosKeyword         Keyoword
hi def link rosVariable        Identifier
hi def link rosOperator        Operator
hi def link rosParameter       Identifier
hi def link rosString          String
hi def link rosNumber          Number

let b:current_syntax = "rsc"
