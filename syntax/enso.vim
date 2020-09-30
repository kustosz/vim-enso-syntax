if exists("b:current_syntax")
  finish
endif

syn match ensoProperVar "\<[a-z][a-z_]*\>" contained
syn match ensoProperType "\<[A-Z][a-z0-9]*\(_[A-Z0-9][a-z0-9]*\)*\>"
syn match ensoAnyIdent "\<[a-zA-Z]\w*\>" contained

syn match ensoImport "^import\s\+.\+\(\s\+as.\+\)\?$" contains=ensoImportKw,ensoProperType
syn match ensoFromImport "^from\s\+.\+\(\s\+as.\+\)\?\s\+import.\+$" contains=ensoImportKw,ensoProperType,ensoFromImportKw
syn match ensoExport "^export\s\+.\+\(\s\+as.\+\)\?$" contains=ensoExportKw,ensoProperType
syn match ensoFromExport "^from\s\+.\+\(\s\+as.\+\)\?\s\+export.\+$" contains=ensoExportKw,ensoProperType,ensoFromImportKw
syn match ensoPolyglotImport "^polyglot\s\+java\s\+import\s\+.\+\(\s\+as.\+\)\?$" contains=ensoImportKw,ensoPolyImportKw,ensoAnyIdent

syn keyword ensoImportKw import as contained
syn keyword ensoExportKw export as contained
syn keyword ensoFromImportKw from all hiding contained
syn keyword ensoPolyImportKw polyglot java contained

syn keyword ensoKeyword type case of if then else
syn keyword ensoThisHere here this
syn region ensoString start='"' end='"' skip='\\"' oneline contains=ensoEscapeBkSlash,ensoEscapeDQuote
syn region ensoStringInt start="\'" end="\'" skip="\\\'" oneline contains=ensoEscape,ensoEscapeSQuote,ensoEscapeBkSlash
syn match ensoOperator "[-!$%&\*\+/<=>\?^|~:.]\+\|\<_\>"
syn match ensoNumber "\<[0-9]\+\(\.[0-9]\+\)\?\>"
syn match ensoAssignOp "="

"syn match ensoDef "^\([A-Z]\w*\(\s*\)\.\2\)\?\<[a-zA-Z][a-zA-Z_]*\>\s*=" contains=ensoProperVar,ensoProperType,ensoAssignOp

syn match ensoEscape "\\u{[A-F0-9]\{1,8}}" contained
syn match ensoEscape "\\u[A-F0-9]\{4}" contained
syn match ensoEscape "\\U[A-F0-9]\{8}" contained
syn match ensoEscape "\\[abfnrtve]" contained
syn match ensoEscapeSQuote "\\'" contained
syn match ensoEscapeDQuote '\\"' contained
syn match ensoEscapeBkSlash "\\\\" contained

syn region ensoComment start="#" end="$" oneline
syn region ensoDoc start="^\z(\s*\)##" end="^\(\z1  \|$\)\@!"
syn region ensoStringBlock start='\(^\z(\s*\).*\)\@<="""' end="^\(\z1 \|$\)\@!"
syn region ensoStringBlockInt start="\(^\z(\s*\).*\)\@<='''" end="^\(\z1 \|$\)\@!" contains=ensoEscape,ensoEscapeBkSlash

syn sync fromstart

hi def link ensoString String
hi def link ensoStringBlock String

hi def link ensoStringInt String
hi def link ensoStringBlockInt String

hi def link ensoEscape SpecialChar
hi def link ensoEscapeSQuote SpecialChar
hi def link ensoEscapeDQuote SpecialChar
hi def link ensoEscapeBkSlash SpecialChar

hi def link ensoKeyword Keyword
hi def link ensoImportKw Keyword
hi def link ensoExportKw Keyword
hi def link ensoFromImportKw Keyword
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
