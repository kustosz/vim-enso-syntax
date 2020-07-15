if exists("b:current_syntax")
  finish
endif

syn match ensoProperVar "\<[a-z][a-z_]*\>" contained
syn match ensoProperType "\<[A-Z][a-z0-9]*\(_[A-Z][a-z0-9]*\)*\>"
syn match ensoAnyIdent "\<[a-zA-Z]\w*\>" contained

syn match ensoImport "^import\s\+.\+\(\s\+as.\+\)\?$" contains=ensoImportKw,ensoProperType
syn match ensoPolyglotImport "^polyglot\s\+java\s\+import\s\+.\+\(\s\+as.\+\)\?$" contains=ensoImportKw,ensoPolyImportKw,ensoAnyIdent

syn keyword ensoImportKw import as contained
syn keyword ensoPolyImportKw polyglot java contained

syn keyword ensoKeyword type case of if then else
syn keyword ensoThisHere here this
syn region ensoString start='"' end='"' skip='\\"' oneline
syn region ensoString start="\'" end="\'" skip="\\\'" oneline
syn match ensoOperator "[-!$%&\*\+/<=>\?^|~:.]\+\|\<_\>"
syn match ensoAssignOp "="
syn match ensoNumber "\<[0-9]\+\>"

"syn match ensoDef "^\([A-Z]\w*\(\s*\)\.\2\)\?\<[a-zA-Z][a-zA-Z_]*\>\s*=" contains=ensoProperVar,ensoProperType,ensoAssignOp

syn region ensoComment start="#" end="$" oneline
syn region ensoDoc start="^\z(\s*\)##" end="^\(\z1  \|$\)\@!"

hi def link ensoString String
hi def link ensoKeyword Keyword
hi def link ensoImportKw Keyword
hi def link ensoPolyImportKw Keyword
hi def link ensoProperType Type
hi def link ensoOperator Operator
hi def link ensoAssignOp Operator
hi def link ensoNumber Number
hi def link ensoProperVar Function
hi def link ensoAnyIdent Type
hi def link ensoThisHere Function
hi def link ensoComment Comment
hi def link ensoDoc Comment

let b:current_syntax = "enso"
