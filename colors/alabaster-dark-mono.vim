""
" Name:        alabaster-dark-mono.vim
" Description: Dark monochrome variant - only cursor is colored, depth via brightness.
"              Inspired by tonsky's Alabaster theme.
" Maintainer:  sderev
" License:     MIT
"""

" ============================================================================
" COLOR PALETTE
" ============================================================================

" Base backgrounds
let s:bg_main        = '#111111'   " cterm: 233 - Almost black
let s:bg_dark        = '#333333'   " cterm: 236 - Dark grey (for emphasis)
let s:bg_highlight   = '#181818'   " cterm: 234 - Very subtle highlight
let s:bg_selection   = '#2b2b2b'   " cterm: 235 - Subtle selection

" Foreground colors
let s:fg_medium      = '#999999'   " cterm: 246 - Medium grey (main text)
let s:fg_bright      = '#eeeeee'   " cterm: 255 - Almost white (highlighted elements)
let s:fg_dim         = '#666666'   " cterm: 241 - Dim grey (less important)

" Accent colors (only cursor is colored in dark mono variant!)
let s:gold           = '#cd974b'   " cterm: 179 - Warm gold (cursor - ONLY colored element)

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

set background=dark
hi clear

if exists('syntax_on')
    syntax reset
endif

let g:colors_name='alabaster-dark-mono'
set t_Co=256

" ============================================================================
" UI ELEMENTS
" ============================================================================

call s:HL('ColorColumn',      s:fg_medium,    s:bg_dark,       '246', '236')
call s:HL('Conceal',          s:fg_medium,    s:bg_main,       '246', '233')
call s:HL('Cursor',           s:bg_main,      s:gold,          '233', '179')
call s:HL('lCursor',          s:bg_main,      s:gold,          '233', '179')
call s:HL('CursorIM',         s:bg_main,      s:gold,          '233', '179')
call s:HL('CursorColumn',     '',             s:bg_highlight,  '',    '234')
call s:HL('CursorLine',       '',             s:bg_highlight,  '',    '234')
call s:HL('Directory',        s:fg_bright,    s:bg_dark,       '255', '236')
call s:HL('DiffAdd',          s:fg_bright,    s:bg_dark,       '255', '236')
call s:HL('DiffChange',       s:fg_medium,    s:bg_dark,       '246', '236')
call s:HL('DiffDelete',       s:fg_dim,       s:bg_main,       '241', '233')
call s:HL('DiffText',         s:fg_bright,    s:bg_dark,       '255', '236')
call s:HL('EndOfBuffer',      s:fg_dim,       '',              '241', '')
call s:HL('ErrorMsg',         s:fg_bright,    s:bg_dark,       '255', '236')
call s:HL('VertSplit',        s:fg_dim,       s:bg_main,       '241', '233')
call s:HL('Folded',           s:fg_medium,    s:bg_dark,       '246', '236')
call s:HL('FoldColumn',       s:fg_medium,    s:bg_dark,       '246', '236')
call s:HL('SignColumn',       s:fg_dim,       s:bg_main,       '241', '233')
call s:HL('IncSearch',        s:bg_main,      s:gold,          '233', '179')
call s:HL('LineNr',           s:fg_dim,       s:bg_main,       '241', '233')
call s:HL('LineNrAbove',      s:fg_dim,       '',              '239', '')
call s:HL('LineNrBelow',      s:fg_dim,       '',              '239', '')
call s:HL('CursorLineNr',     s:gold,         '',              '179', '')
call s:HL('MatchParen',       s:fg_bright,    s:bg_dark,       '255', '236')
call s:HL('ModeMsg',          s:fg_medium,    s:bg_main,       '246', '233')
call s:HL('MoreMsg',          s:fg_medium,    s:bg_main,       '246', '233')
call s:HL('NonText',          s:fg_dim,       s:bg_main,       '241', '233')
call s:HL('Pmenu',            s:fg_medium,    s:bg_dark,       '246', '236')
call s:HL('PmenuSel',         s:fg_bright,    s:bg_dark,       '255', '236')
call s:HL('PmenuSbar',        s:fg_medium,    s:bg_dark,       '246', '236')
call s:HL('PmenuThumb',       s:fg_bright,    s:bg_dark,       '255', '236')
call s:HL('Question',         s:fg_medium,    s:bg_main,       '246', '233')
call s:HL('QuickFixLine',     s:fg_bright,    s:bg_dark,       '255', '236')
call s:HL('Search',           s:bg_main,      s:gold,          '233', '179')
call s:HL('SpecialKey',       s:fg_dim,       '',              '241', '')
call s:HL('SpellBad',         s:fg_bright,    s:bg_dark,       '255', '236')
call s:HL('SpellCap',         s:fg_medium,    s:bg_dark,       '246', '236')
call s:HL('SpellLocal',       s:fg_bright,    s:bg_dark,       '255', '236')
call s:HL('SpellRare',        s:fg_medium,    s:bg_dark,       '246', '236')
call s:HL('StatusLine',       s:fg_medium,    s:bg_dark,       '246', '236')
call s:HL('StatusLineNC',     s:fg_dim,       s:bg_dark,       '241', '236')
call s:HL('StatusLineTerm',   s:fg_medium,    s:bg_dark,       '246', '236')
call s:HL('StatusLineTermNC', s:fg_dim,       s:bg_dark,       '241', '236')
call s:HL('TabLine',          s:fg_medium,    s:bg_dark,       '246', '236')
call s:HL('TabLineFill',      s:fg_dim,       s:bg_dark,       '241', '236')
call s:HL('TabLineSel',       s:fg_bright,    s:bg_dark,       '255', '236')
call s:HL('Terminal',         s:fg_medium,    s:bg_main,       '246', '233')
call s:HL('Title',            s:fg_bright,    s:bg_dark,       '255', '236')
call s:HL('Visual',           '',             s:bg_selection,  '',    '235')
call s:HL('VisualNOS',        s:fg_medium,    s:bg_dark,       '246', '236')
call s:HL('WarningMsg',       s:fg_bright,    s:bg_dark,       '255', '236')
call s:HL('WildMenu',         s:bg_main,      s:gold,          '233', '179')

" Modern Neovim UI groups (Neovim 0.4+)
call s:HL('NormalFloat',      s:fg_medium,    s:bg_dark,       '246', '236')
call s:HL('FloatBorder',      s:fg_dim,       s:bg_dark,       '241', '236')
call s:HL('NormalNC',         s:fg_medium,    s:bg_main,       '246', '233')
call s:HL('Whitespace',       s:fg_dim,       '',              '241', '')

" LSP Diagnostic groups (Neovim 0.6+)
call s:HL('DiagnosticError',  s:fg_bright,    s:bg_dark,       '255', '236')
call s:HL('DiagnosticWarn',   s:gold,         '',              '179', '')
call s:HL('DiagnosticInfo',   s:fg_medium,    '',              '246', '')
call s:HL('DiagnosticHint',   s:fg_dim,       '',              '241', '')
call s:HL('DiagnosticOk',     s:fg_bright,    '',              '255', '')

" ============================================================================
" SYNTAX HIGHLIGHTING - MAJOR GROUPS
" ============================================================================
" Dark monochrome: depth via brightness, not colors

call s:HL('Normal',     s:fg_medium, s:bg_main,    '246', '233')
call s:HL('Comment',    s:fg_bright, '',           '255', '')
call s:HL('Constant',   s:fg_bright, '',           '255', '')
call s:HL('Identifier', s:fg_bright, '',           '255', '')
call s:HL('Statement',  s:fg_medium, '',           '246', '')
call s:HL('PreProc',    s:fg_medium, '',           '246', '')
call s:HL('Type',       s:fg_medium, '',           '246', '')
call s:HL('Special',    s:fg_medium, '',           '246', '')
call s:HL('Underlined', s:fg_bright, '',           '255', '')
call s:HL('Ignore',     s:fg_dim,    '',           '241', '')
call s:HL('Error',      s:fg_bright, s:bg_dark,    '255', '236')
call s:HL('Todo',       s:fg_bright, s:bg_dark,    '255', '236')

" ============================================================================
" SYNTAX HIGHLIGHTING - MINOR GROUPS
" ============================================================================

call s:HL('String',         s:fg_bright, '',        '255', '')
call s:HL('Character',      s:fg_bright, '',        '255', '')
call s:HL('Number',         s:fg_bright, '',        '255', '')
call s:HL('Boolean',        s:fg_bright, '',        '255', '')
call s:HL('Float',          s:fg_bright, '',        '255', '')
call s:HL('Function',       s:fg_bright, '',        '255', '')
call s:HL('Conditional',    s:fg_medium, '',        '246', '')
call s:HL('Repeat',         s:fg_medium, '',        '246', '')
call s:HL('Label',          s:fg_medium, '',        '246', '')
call s:HL('Operator',       s:fg_medium, '',        '246', '')
call s:HL('Keyword',        s:fg_medium, '',        '246', '')
call s:HL('Exception',      s:fg_medium, '',        '246', '')
call s:HL('Include',        s:fg_medium, '',        '246', '')
call s:HL('Define',         s:fg_bright, '',        '255', '')
call s:HL('Macro',          s:fg_medium, '',        '246', '')
call s:HL('PreCondit',      s:fg_medium, '',        '246', '')
call s:HL('StorageClass',   s:fg_medium, '',        '246', '')
call s:HL('Structure',      s:fg_medium, '',        '246', '')
call s:HL('Typedef',        s:fg_medium, '',        '246', '')
call s:HL('SpecialChar',    s:fg_bright, '',        '255', '')
call s:HL('Tag',            s:fg_bright, '',        '255', '')
call s:HL('Delimiter',      s:fg_medium, '',        '246', '')
call s:HL('SpecialComment', s:fg_bright, '',        '255', '')
call s:HL('Debug',          s:fg_medium, '',        '246', '')

" ============================================================================
" CUSTOM SYNTAX - BRACKETS AND DELIMITERS
" ============================================================================
" Enhanced highlighting for brackets and delimiters.
" By default, applies to programming languages only (not text files like markdown).
" Users can customize by setting g:alabaster_dark_mono_prog_languages.
" Set to empty string '' to apply to ALL filetypes.
" Example: let g:alabaster_dark_mono_prog_languages = 'python,javascript,rust'

" Default programming language list
let s:default_prog_languages = 'bash,c,cpp,css,go,html,java,javascript,php,python,ruby,rust,sh,shell,typescript'

" Allow user customization via g:alabaster_dark_mono_prog_languages
if !exists('g:alabaster_dark_mono_prog_languages')
    let g:alabaster_dark_mono_prog_languages = s:default_prog_languages
endif

function! s:ApplyBracketsAndDelimiters()
    " Apply to all languages if empty, otherwise check if current filetype is in the list
    if g:alabaster_dark_mono_prog_languages == '' || index(split(g:alabaster_dark_mono_prog_languages, ','), &filetype) >= 0
        syntax match Brackets "[\[\]{}()]"
        syntax match Delimiters "[;]"
        " Outer brackets: bright
        execute 'highlight Brackets guifg=' . s:fg_bright . ' ctermfg=255'
        " Inner brackets: medium grey (shows nesting depth)
        execute 'highlight Delimiters guifg=' . s:fg_medium . ' ctermfg=246'
    endif
endfunction

" Apply on all FileType events
augroup alabaster_dark_mono_custom_syntax
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

execute 'hi pythonBoolean guifg=' . s:fg_bright . ' ctermfg=255'
execute 'hi pythonConstant guifg=' . s:fg_bright . ' ctermfg=255'
execute 'hi pythonFunction guifg=' . s:fg_bright . ' ctermfg=255 guibg=NONE ctermbg=NONE'
execute 'hi pythonQuotes guifg=' . s:fg_medium . ' ctermfg=246'
execute 'hi pythonTripleQuotes guifg=' . s:fg_bright . ' ctermfg=255 guibg=NONE ctermbg=NONE'
execute 'hi pythonBuiltin guifg=' . s:fg_medium . ' ctermfg=246'

" Assign False, True, and None keywords from pythonBuiltin to pythonConstant.
" Function ensures consistent application when opening Python files or sourcing .vimrc.
function! s:ApplyCustomPythonColors()
    syn keyword pythonConstant False True None
endfunction

augroup alabaster_dark_mono_python_colors
    autocmd!
    autocmd FileType python call s:ApplyCustomPythonColors()
augroup END

call s:ApplyCustomPythonColors()

" ----------------------------------------------------------------------------
" reStructuredText (reST)
" ----------------------------------------------------------------------------
" Commonly used for documentation (Sphinx, Python docs)

" Document Structure
execute 'hi rstSections guifg=' . s:fg_bright . ' guibg=NONE ctermfg=255 ctermbg=NONE'
execute 'hi rstTransition guifg=' . s:fg_bright . ' guibg=NONE ctermfg=255 ctermbg=NONE'

" Code & Literals
execute 'hi rstInlineLiteral guifg=' . s:fg_bright . ' guibg=' . s:bg_dark . ' ctermfg=255 ctermbg=236'
execute 'hi rstLiteralBlock guifg=' . s:fg_bright . ' guibg=NONE ctermfg=255 ctermbg=NONE'
execute 'hi rstCodeBlock guifg=' . s:fg_bright . ' guibg=NONE ctermfg=255 ctermbg=NONE'
execute 'hi rstDoctestBlock guifg=' . s:fg_bright . ' guibg=NONE ctermfg=255 ctermbg=NONE'

" Directives (.. note::, .. warning::, etc.)
execute 'hi rstDirective guifg=' . s:fg_bright . ' guibg=NONE ctermfg=255 ctermbg=NONE'
execute 'hi rstExDirective guifg=' . s:fg_bright . ' guibg=NONE ctermfg=255 ctermbg=NONE'

" Links & References
execute 'hi rstInterpretedTextOrHyperlinkReference guifg=' . s:fg_bright . ' guibg=' . s:bg_dark . ' ctermfg=255 ctermbg=236'
execute 'hi rstStandaloneHyperlink guifg=' . s:fg_bright . ' guibg=NONE ctermfg=255 ctermbg=NONE'
execute 'hi rstHyperlinkTarget guifg=' . s:fg_bright . ' guibg=NONE ctermfg=255 ctermbg=NONE'
execute 'hi rstHyperlinkReference guifg=' . s:fg_bright . ' guibg=NONE ctermfg=255 ctermbg=NONE'

" Citations & Footnotes
execute 'hi rstFootnote guifg=' . s:fg_bright . ' guibg=NONE ctermfg=255 ctermbg=NONE'
execute 'hi rstFootnoteReference guifg=' . s:fg_bright . ' guibg=NONE ctermfg=255 ctermbg=NONE'
execute 'hi rstCitation guifg=' . s:fg_bright . ' guibg=NONE ctermfg=255 ctermbg=NONE'
execute 'hi rstCitationReference guifg=' . s:fg_bright . ' guibg=NONE ctermfg=255 ctermbg=NONE'

" Text Formatting
execute 'hi rstEmphasis guifg=' . s:fg_medium . ' ctermfg=246'
execute 'hi rstStrongEmphasis guifg=' . s:fg_bright . ' gui=bold cterm=bold ctermfg=255'

" Special Elements
execute 'hi rstTodo guifg=' . s:fg_bright . ' guibg=' . s:bg_dark . ' ctermfg=255 ctermbg=236'
execute 'hi rstDelimiter guifg=' . s:fg_medium . ' guibg=NONE ctermfg=246 ctermbg=NONE'

" ----------------------------------------------------------------------------
" C/C++
" ----------------------------------------------------------------------------

execute 'hi cppConstant guifg=' . s:fg_bright . ' ctermfg=255 guibg=NONE ctermbg=NONE'
execute 'hi cFunction guifg=' . s:fg_bright . ' guibg=NONE ctermfg=255 ctermbg=NONE'

" ----------------------------------------------------------------------------
" Markdown
" ----------------------------------------------------------------------------

execute 'hi markdownItalicDelimiter guifg=' . s:fg_dim . ' ctermfg=241'
execute 'hi markdownBlockquote guifg=' . s:fg_medium . ' ctermfg=246'
execute 'hi markdownBold guifg=' . s:fg_bright . ' ctermfg=255'
execute 'hi markdownBoldDelimiter guifg=' . s:fg_medium . ' ctermfg=246'
execute 'hi markdownCode guifg=' . s:fg_bright . ' guibg=NONE ctermfg=255 ctermbg=NONE'
execute 'hi markdownCodeDelimiter guifg=' . s:fg_medium . ' ctermfg=246'
execute 'hi markdownFootnote guifg=' . s:fg_bright . ' ctermfg=255'
execute 'hi markdownHeadingDelimiter guifg=' . s:fg_bright . ' guibg=NONE ctermfg=255 ctermbg=NONE'
execute 'hi markdownItalic guifg=' . s:fg_medium . ' ctermfg=246'
execute 'hi markdownLinkDelimiter guifg=' . s:fg_medium . ' ctermfg=246'
execute 'hi markdownListMarker guifg=' . s:fg_bright . ' ctermfg=255'
execute 'hi markdownOrderedListMarker guifg=' . s:fg_bright . ' ctermfg=255'
execute 'hi markdownLinkText guifg=' . s:fg_medium . ' ctermfg=246'

" ----------------------------------------------------------------------------
" Bash/Shell
" ----------------------------------------------------------------------------

execute 'hi shComment guifg=' . s:fg_bright . ' ctermfg=255'
execute 'hi shString guifg=' . s:fg_bright . ' ctermfg=255'
execute 'hi shFunction guifg=' . s:fg_bright . ' guibg=NONE ctermfg=255 ctermbg=NONE'

" ----------------------------------------------------------------------------
" Go
" ----------------------------------------------------------------------------

execute 'hi goDeclaration guifg=' . s:fg_medium . ' ctermfg=246'
execute 'hi goFunction guifg=' . s:fg_bright . ' guibg=NONE ctermfg=255 ctermbg=NONE'

" ----------------------------------------------------------------------------
" LaTeX
" ----------------------------------------------------------------------------

execute 'hi texTitleArg guifg=' . s:fg_bright . ' guibg=NONE ctermfg=255 ctermbg=NONE'
execute 'hi texStyleItal guifg=' . s:fg_medium . ' ctermfg=246'

" ----------------------------------------------------------------------------
" Llama.vim
" ----------------------------------------------------------------------------

execute 'hi llama_hl_hint guifg=' . s:fg_dim . ' ctermfg=241'
execute 'hi llama_hl_info guifg=' . s:fg_bright . ' guibg=NONE ctermfg=255 ctermbg=NONE'
