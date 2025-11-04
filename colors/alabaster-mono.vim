""
" Name:        alabaster-mono.vim
" Description: Light monochrome variant - only cursor is colored, depth via grey backgrounds.
"              Inspired by tonsky's Alabaster theme.
" Maintainer:  sderev
" License:     MIT
"""

" ============================================================================
" COLOR PALETTE
" ============================================================================

" Base backgrounds
let s:bg_main        = '#ffffff'   " cterm: 231 - Main background (white)
let s:bg_highlight   = '#eeeeee'   " cterm: 255 - Grey for highlighted elements
let s:bg_light_grey  = '#d9d9d9'   " cterm: 253 - Lighter grey for escapes
let s:bg_subtle      = '#fafafa'   " cterm: 255 - Very subtle grey for line highlight

" Foreground colors
let s:fg_black       = '#000000'   " cterm: 16  - Main text
let s:fg_grey        = '#999999'   " cterm: 246 - Comments, nested brackets

" Accent colors (only cursor is colored in mono variant!)
let s:cyan           = '#16bdec'   " cterm: 45  - Cursor (ONLY colored element)
let s:cyan_bright    = '#00d7ff'   " cterm: 45  - Bright cyan for selection

" ============================================================================
" HELPER FUNCTION
" ============================================================================

function! s:HL(group, fg, bg, ctermfg, ctermbg)
  let l:cmd = 'hi ' . a:group . ' guisp=NONE'
  if a:fg != ''
    let l:cmd .= ' guifg=' . a:fg
  endif
  if a:bg != ''
    let l:cmd .= ' guibg=' . a:bg
  endif
  if a:ctermfg != ''
    let l:cmd .= ' ctermfg=' . a:ctermfg
  endif
  if a:ctermbg != ''
    let l:cmd .= ' ctermbg=' . a:ctermbg
  endif
  let l:cmd .= ' gui=NONE cterm=NONE'
  execute l:cmd
endfunction

" ============================================================================
" VIM INITIALIZATION
" ============================================================================

set background=light
hi clear

if exists('syntax_on')
    syntax reset
endif

let g:colors_name='alabaster-mono'
set t_Co=256

" ============================================================================
" UI ELEMENTS
" ============================================================================

call s:HL('ColorColumn',      s:fg_black,     s:bg_highlight,  '16',  '255')
call s:HL('Conceal',          s:fg_black,     s:bg_main,       '16',  '231')
call s:HL('Cursor',           s:fg_black,     s:cyan,          '16',  '45')
call s:HL('lCursor',          s:fg_black,     s:cyan,          '16',  '45')
call s:HL('CursorIM',         s:fg_black,     s:cyan,          '16',  '45')
call s:HL('CursorColumn',     '',             s:bg_subtle,     '',    '255')
call s:HL('CursorLine',       '',             s:bg_subtle,     '',    '255')
call s:HL('Directory',        s:fg_black,     s:bg_highlight,  '16',  '255')
call s:HL('DiffAdd',          s:fg_black,     s:bg_highlight,  '16',  '255')
call s:HL('DiffChange',       s:fg_black,     s:bg_light_grey, '16',  '253')
call s:HL('DiffDelete',       s:fg_grey,      s:bg_main,       '246', '231')
call s:HL('DiffText',         s:fg_black,     s:bg_highlight,  '16',  '255')
call s:HL('EndOfBuffer',      s:fg_grey,      '',              '246', '')
call s:HL('ErrorMsg',         s:fg_black,     s:bg_light_grey, '16',  '253')
call s:HL('VertSplit',        s:fg_grey,      s:bg_main,       '246', '231')
call s:HL('Folded',           s:fg_grey,      s:bg_main,       '246', '231')
call s:HL('FoldColumn',       s:fg_grey,      s:bg_main,       '246', '231')
call s:HL('SignColumn',       s:fg_grey,      s:bg_main,       '246', '231')
call s:HL('IncSearch',        s:fg_black,     s:cyan,          '16',  '45')
call s:HL('LineNr',           s:fg_grey,      s:bg_main,       '246', '231')
call s:HL('LineNrAbove',      s:fg_grey,      '',              '248', '')
call s:HL('LineNrBelow',      s:fg_grey,      '',              '248', '')
call s:HL('CursorLineNr',     s:fg_black,     '',              '16',  '')
call s:HL('MatchParen',       s:fg_black,     s:bg_highlight,  '16',  '255')
call s:HL('ModeMsg',          s:fg_black,     s:bg_main,       '16',  '231')
call s:HL('MoreMsg',          s:fg_black,     s:bg_main,       '16',  '231')
call s:HL('NonText',          s:fg_grey,      s:bg_main,       '246', '231')
call s:HL('Pmenu',            s:fg_black,     s:bg_light_grey, '16',  '253')
call s:HL('PmenuSel',         s:fg_black,     s:bg_highlight,  '16',  '255')
call s:HL('PmenuSbar',        s:fg_black,     s:bg_light_grey, '16',  '253')
call s:HL('PmenuThumb',       s:fg_black,     s:bg_highlight,  '16',  '255')
call s:HL('Question',         s:fg_black,     s:bg_main,       '16',  '231')
call s:HL('QuickFixLine',     s:fg_black,     s:bg_highlight,  '16',  '255')
call s:HL('Search',           s:fg_black,     s:bg_highlight,  '16',  '255')
call s:HL('SpecialKey',       s:fg_grey,      '',              '246', '')
call s:HL('SpellBad',         s:fg_black,     s:bg_light_grey, '16',  '253')
call s:HL('SpellCap',         s:fg_grey,      s:bg_light_grey, '246', '253')
call s:HL('SpellLocal',       s:fg_black,     s:bg_highlight,  '16',  '255')
call s:HL('SpellRare',        s:fg_grey,      s:bg_highlight,  '246', '255')
call s:HL('StatusLine',       s:fg_black,     s:bg_light_grey, '16',  '253')
call s:HL('StatusLineNC',     s:fg_grey,      s:bg_light_grey, '246', '253')
call s:HL('StatusLineTerm',   s:fg_black,     s:bg_light_grey, '16',  '253')
call s:HL('StatusLineTermNC', s:fg_grey,      s:bg_light_grey, '246', '253')
call s:HL('TabLine',          s:fg_black,     s:bg_light_grey, '16',  '253')
call s:HL('TabLineFill',      s:fg_grey,      s:bg_light_grey, '246', '253')
call s:HL('TabLineSel',       s:fg_black,     s:bg_main,       '16',  '231')
call s:HL('Terminal',         s:fg_black,     s:bg_main,       '16',  '231')
call s:HL('Title',            s:fg_black,     s:bg_highlight,  '16',  '255')
call s:HL('Visual',           '',             s:bg_light_grey, '',    '253')
call s:HL('VisualNOS',        s:fg_grey,      s:bg_main,       '246', '231')
call s:HL('WarningMsg',       s:fg_black,     s:bg_light_grey, '16',  '253')
call s:HL('WildMenu',         s:fg_black,     s:bg_main,       '16',  '231')

" Modern Neovim UI groups (Neovim 0.4+)
call s:HL('NormalFloat',      s:fg_black,     s:bg_light_grey, '16',  '253')
call s:HL('FloatBorder',      s:fg_grey,      s:bg_light_grey, '246', '253')
call s:HL('NormalNC',         s:fg_black,     s:bg_main,       '16',  '231')
call s:HL('Whitespace',       s:fg_grey,      '',              '246', '')

" LSP Diagnostic groups (Neovim 0.6+)
call s:HL('DiagnosticError',  s:fg_black,     s:bg_light_grey, '16',  '253')
call s:HL('DiagnosticWarn',   s:fg_black,     s:bg_highlight,  '16',  '255')
call s:HL('DiagnosticInfo',   s:fg_black,     s:bg_highlight,  '16',  '255')
call s:HL('DiagnosticHint',   s:fg_grey,      '',              '246', '')
call s:HL('DiagnosticOk',     s:fg_black,     s:bg_highlight,  '16',  '255')

" ============================================================================
" SYNTAX HIGHLIGHTING - MAJOR GROUPS
" ============================================================================
" Monochrome: depth via grey backgrounds, not colors

call s:HL('Normal',     s:fg_black, s:bg_main,      '16',  '231')
call s:HL('Comment',    s:fg_grey,  '',             '246', '')
call s:HL('Constant',   s:fg_black, s:bg_highlight, '16',  '255')
call s:HL('Identifier', s:fg_black, s:bg_highlight, '16',  '255')
call s:HL('Statement',  s:fg_black, '',             '16',  '')
call s:HL('PreProc',    s:fg_black, '',             '16',  '')
call s:HL('Type',       s:fg_black, '',             '16',  '')
call s:HL('Special',    s:fg_black, '',             '16',  '')
call s:HL('Underlined', s:fg_black, '',             '16',  '')
call s:HL('Ignore',     s:fg_grey,  '',             '246', '')
call s:HL('Error',      s:fg_black, s:bg_light_grey, '16',  '253')
call s:HL('Todo',       s:fg_black, s:bg_highlight, '16',  '255')

" ============================================================================
" SYNTAX HIGHLIGHTING - MINOR GROUPS
" ============================================================================

call s:HL('String',         s:fg_black, s:bg_highlight,   '16',  '255')
call s:HL('Character',      s:fg_black, s:bg_highlight,   '16',  '255')
call s:HL('Number',         s:fg_black, s:bg_highlight,   '16',  '255')
call s:HL('Boolean',        s:fg_black, s:bg_highlight,   '16',  '255')
call s:HL('Float',          s:fg_black, s:bg_highlight,   '16',  '255')
call s:HL('Function',       s:fg_black, s:bg_highlight,   '16',  '255')
call s:HL('Conditional',    s:fg_black, '',               '16',  '')
call s:HL('Repeat',         s:fg_black, '',               '16',  '')
call s:HL('Label',          s:fg_black, '',               '16',  '')
call s:HL('Operator',       s:fg_black, '',               '16',  '')
call s:HL('Keyword',        s:fg_black, '',               '16',  '')
call s:HL('Exception',      s:fg_black, '',               '16',  '')
call s:HL('Include',        s:fg_black, '',               '16',  '')
call s:HL('Define',         s:fg_black, s:bg_highlight,   '16',  '255')
call s:HL('Macro',          s:fg_black, '',               '16',  '')
call s:HL('PreCondit',      s:fg_black, '',               '16',  '')
call s:HL('StorageClass',   s:fg_black, '',               '16',  '')
call s:HL('Structure',      s:fg_black, '',               '16',  '')
call s:HL('Typedef',        s:fg_black, '',               '16',  '')
call s:HL('SpecialChar',    s:fg_black, s:bg_light_grey,  '16',  '253')
call s:HL('Tag',            s:fg_black, s:bg_highlight,   '16',  '255')
call s:HL('Delimiter',      s:fg_grey,  '',               '246', '')
call s:HL('SpecialComment', s:fg_grey,  '',               '246', '')
call s:HL('Debug',          s:fg_black, '',               '16',  '')

" ============================================================================
" CUSTOM SYNTAX - BRACKETS AND DELIMITERS
" ============================================================================
" Enhanced highlighting for brackets and delimiters.
" By default, applies to programming languages only (not text files like markdown).
" Users can customize by setting g:alabaster_mono_prog_languages.
" Set to empty string '' to apply to ALL filetypes.
" Example: let g:alabaster_mono_prog_languages = 'python,javascript,rust'

" Default programming language list
let s:default_prog_languages = 'bash,c,cpp,css,go,html,java,javascript,php,python,ruby,rust,sh,shell,typescript'

" Allow user customization via g:alabaster_mono_prog_languages
if !exists('g:alabaster_mono_prog_languages')
    let g:alabaster_mono_prog_languages = s:default_prog_languages
endif

function! s:ApplyBracketsAndDelimiters()
    " Apply to all languages if empty, otherwise check if current filetype is in the list
    if g:alabaster_mono_prog_languages == '' || index(split(g:alabaster_mono_prog_languages, ','), &filetype) >= 0
        syntax match Brackets "[\[\]{}()]"
        syntax match Delimiters "[;]"
        execute 'highlight Brackets guifg=' . s:fg_grey . ' ctermfg=246'
        execute 'highlight Delimiters guifg=' . s:fg_grey . ' ctermfg=246'
    endif
endfunction

" Apply on all FileType events
augroup alabaster_mono_custom_syntax
    autocmd!
    autocmd FileType * call s:ApplyBracketsAndDelimiters()
augroup END

" Apply immediately if current buffer has a filetype
if &filetype != ''
    call s:ApplyBracketsAndDelimiters()
endif

" ============================================================================
" LANGUAGE-SPECIFIC OVERRIDES
" ============================================================================

" ----------------------------------------------------------------------------
" Python
" ----------------------------------------------------------------------------

execute 'hi pythonBoolean guifg=' . s:fg_black . ' guibg=' . s:bg_highlight . ' ctermfg=16 ctermbg=255'
execute 'hi pythonConstant guifg=' . s:fg_black . ' guibg=' . s:bg_highlight . ' ctermfg=16 ctermbg=255'
execute 'hi pythonFunction guifg=' . s:fg_black . ' guibg=' . s:bg_highlight . ' ctermfg=16 ctermbg=255'
execute 'hi pythonQuotes guifg=' . s:fg_grey . ' ctermfg=246'
execute 'hi pythonTripleQuotes guifg=' . s:fg_grey . ' ctermfg=246'
execute 'hi pythonBuiltin guifg=' . s:fg_black . ' ctermfg=16'

" Assign False, True, and None keywords from pythonBuiltin to pythonConstant.
" Function ensures consistent application when opening Python files or sourcing .vimrc.
function! s:ApplyCustomPythonColors()
    syn keyword pythonConstant False True None
endfunction

augroup alabaster_mono_python_colors
    autocmd!
    autocmd FileType python call s:ApplyCustomPythonColors()
augroup END

call s:ApplyCustomPythonColors()

" ----------------------------------------------------------------------------
" reStructuredText (reST)
" ----------------------------------------------------------------------------
" Commonly used for documentation (Sphinx, Python docs)

" Document Structure
execute 'hi rstSections guifg=' . s:fg_black . ' guibg=' . s:bg_highlight . ' ctermfg=16 ctermbg=255'
execute 'hi rstTransition guifg=' . s:fg_black . ' guibg=' . s:bg_highlight . ' ctermfg=16 ctermbg=255'

" Code & Literals
execute 'hi rstInlineLiteral guifg=' . s:fg_black . ' guibg=' . s:bg_highlight . ' ctermfg=16 ctermbg=255'
execute 'hi rstLiteralBlock guifg=' . s:fg_black . ' guibg=' . s:bg_highlight . ' ctermfg=16 ctermbg=255'
execute 'hi rstCodeBlock guifg=' . s:fg_black . ' guibg=' . s:bg_highlight . ' ctermfg=16 ctermbg=255'
execute 'hi rstDoctestBlock guifg=' . s:fg_black . ' guibg=' . s:bg_highlight . ' ctermfg=16 ctermbg=255'

" Directives (.. note::, .. warning::, etc.)
execute 'hi rstDirective guifg=' . s:fg_black . ' guibg=' . s:bg_highlight . ' ctermfg=16 ctermbg=255'
execute 'hi rstExDirective guifg=' . s:fg_black . ' guibg=' . s:bg_highlight . ' ctermfg=16 ctermbg=255'

" Links & References
execute 'hi rstInterpretedTextOrHyperlinkReference guifg=' . s:fg_black . ' guibg=' . s:bg_highlight . ' ctermfg=16 ctermbg=255'
execute 'hi rstStandaloneHyperlink guifg=' . s:fg_black . ' guibg=' . s:bg_highlight . ' ctermfg=16 ctermbg=255'
execute 'hi rstHyperlinkTarget guifg=' . s:fg_black . ' guibg=' . s:bg_highlight . ' ctermfg=16 ctermbg=255'
execute 'hi rstHyperlinkReference guifg=' . s:fg_black . ' guibg=' . s:bg_highlight . ' ctermfg=16 ctermbg=255'

" Citations & Footnotes
execute 'hi rstFootnote guifg=' . s:fg_black . ' guibg=' . s:bg_highlight . ' ctermfg=16 ctermbg=255'
execute 'hi rstFootnoteReference guifg=' . s:fg_black . ' guibg=' . s:bg_highlight . ' ctermfg=16 ctermbg=255'
execute 'hi rstCitation guifg=' . s:fg_black . ' guibg=' . s:bg_highlight . ' ctermfg=16 ctermbg=255'
execute 'hi rstCitationReference guifg=' . s:fg_black . ' guibg=' . s:bg_highlight . ' ctermfg=16 ctermbg=255'

" Text Formatting
execute 'hi rstEmphasis guifg=' . s:fg_black . ' ctermfg=16'
execute 'hi rstStrongEmphasis guifg=' . s:fg_black . ' gui=bold cterm=bold ctermfg=16'

" Special Elements
execute 'hi rstTodo guifg=' . s:fg_black . ' guibg=' . s:bg_highlight . ' ctermfg=16 ctermbg=255'
execute 'hi rstDelimiter guifg=' . s:fg_grey . ' guibg=NONE ctermfg=246 ctermbg=NONE'

" ----------------------------------------------------------------------------
" C/C++
" ----------------------------------------------------------------------------

execute 'hi cppConstant guifg=' . s:fg_black . ' guibg=' . s:bg_highlight . ' ctermfg=16 ctermbg=255'
execute 'hi cFunction guifg=' . s:fg_black . ' guibg=' . s:bg_highlight . ' ctermfg=16 ctermbg=255'

" ----------------------------------------------------------------------------
" Markdown
" ----------------------------------------------------------------------------

execute 'hi markdownItalicDelimiter guifg=' . s:fg_grey . ' ctermfg=246'
execute 'hi markdownBlockquote guifg=' . s:fg_grey . ' ctermfg=246'
execute 'hi markdownBold guifg=' . s:fg_black . ' ctermfg=16'
execute 'hi markdownBoldDelimiter guifg=' . s:fg_grey . ' ctermfg=246'
execute 'hi markdownCode guifg=' . s:fg_black . ' guibg=' . s:bg_highlight . ' ctermfg=16 ctermbg=255'
execute 'hi markdownCodeDelimiter guifg=' . s:fg_grey . ' ctermfg=246'
execute 'hi markdownFootnote guifg=' . s:fg_black . ' guibg=' . s:bg_highlight . ' ctermfg=16 ctermbg=255'
execute 'hi markdownHeadingDelimiter guifg=' . s:fg_black . ' guibg=' . s:bg_highlight . ' ctermfg=16 ctermbg=255'
execute 'hi markdownItalic guifg=' . s:fg_black . ' ctermfg=16'
execute 'hi markdownLinkDelimiter guifg=' . s:fg_grey . ' ctermfg=246'
execute 'hi markdownListMarker guifg=' . s:fg_black . ' ctermfg=16'
execute 'hi markdownOrderedListMarker guifg=' . s:fg_black . ' ctermfg=16'
execute 'hi markdownLinkText guifg=' . s:fg_black . ' ctermfg=16'

" ----------------------------------------------------------------------------
" Bash/Shell
" ----------------------------------------------------------------------------

execute 'hi shComment guifg=' . s:fg_grey . ' ctermfg=246'
execute 'hi shString guifg=' . s:fg_black . ' guibg=' . s:bg_highlight . ' ctermfg=16 ctermbg=255'
execute 'hi shFunction guifg=' . s:fg_black . ' guibg=' . s:bg_highlight . ' ctermfg=16 ctermbg=255'

" ----------------------------------------------------------------------------
" Go
" ----------------------------------------------------------------------------

execute 'hi goDeclaration guifg=' . s:fg_black . ' ctermfg=16'
execute 'hi goFunction guifg=' . s:fg_black . ' guibg=' . s:bg_highlight . ' ctermfg=16 ctermbg=255'

" ----------------------------------------------------------------------------
" LaTeX
" ----------------------------------------------------------------------------

execute 'hi texTitleArg guifg=' . s:fg_black . ' guibg=' . s:bg_highlight . ' ctermfg=16 ctermbg=255'
execute 'hi texStyleItal guifg=' . s:fg_black . ' ctermfg=16'

" ----------------------------------------------------------------------------
" Llama.vim
" ----------------------------------------------------------------------------

execute 'hi llama_hl_hint guifg=' . s:fg_grey . ' ctermfg=246'
execute 'hi llama_hl_info guifg=' . s:fg_black . ' guibg=' . s:bg_highlight . ' ctermfg=16 ctermbg=255'
