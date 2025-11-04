""
" Name:        alabaster.vim
" Description: Light theme with subtle colors.
"              Inspired by tonsky's Alabaster theme.
" Maintainer:  sderev
" License:     MIT
"""

" ============================================================================
" COLOR PALETTE
" ============================================================================

" Background colors
let s:bg_main          = '#f8f8f8'  " cterm: 231 - Main background
let s:bg_highlight     = '#f0f0f0'  " cterm: 255 - Subtle highlight (cursorline, floats)
let s:bg_lighter       = '#f1f1f1'  " cterm: 255 - Lighter shade
let s:bg_dark          = '#1c1c1c'  " cterm: 234 - Dark background (unused in light theme)
let s:bg_grey_dark     = '#404040'  " cterm: 238 - Dark grey
let s:bg_grey_darker   = '#444444'  " cterm: 238 - Darker grey

" Foreground colors
let s:fg_main          = '#000000'  " cterm: 16  - Main text
let s:fg_white         = '#ffffff'  " cterm: 231 - White
let s:fg_grey          = '#777777'  " cterm: 243 - Grey (delimiters, hints)
let s:fg_grey_light    = '#9da39a'  " cterm: 247 - Light grey
let s:fg_grey_lighter  = '#cccccc'  " cterm: 252 - Lighter grey

" Semantic colors
let s:blue             = '#325cc0'  " cterm: 61  - Functions, identifiers, titles
let s:blue_dark        = '#0b216f'  " cterm: 17  - Line numbers, sign column
let s:blue_bright      = '#007acc'  " cterm: 32  - Directory, hyperlinks, tags
let s:blue_light       = '#c3dbfd'  " cterm: 153 - Light blue backgrounds
let s:blue_lighter     = '#bfdbfe'  " cterm: 153 - Lighter blue backgrounds
let s:blue_lightest    = '#deebfc'  " cterm: 189 - Lightest blue background
let s:blue_diff        = '#a8c5fc'  " cterm: 153 - Diff text background

let s:red              = '#aa3731'  " cterm: 131 - Comments, errors
let s:red_light        = '#fac3c0'  " cterm: 223 - Error/spell backgrounds

let s:purple           = '#7a3e9d'  " cterm: 97  - Constants, keywords
let s:green            = '#448C27'  " cterm: 64  - Strings
let s:green_light      = '#d0f0c0'  " cterm: 194 - Todo/diff add background
let s:yellow           = '#ffbc5d'  " cterm: 215 - Cursor, search, warnings, list markers
let s:yellow_light     = '#f0e5b8'  " cterm: 223 - Search background

let s:pink_light       = '#ffd8d8'  " cterm: 224 - Diff delete background
let s:grey_medium      = '#808080'  " cterm: 244 - Medium grey (llama hint)

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

let g:colors_name='alabaster'
set t_Co=256

" ============================================================================
" UI ELEMENTS
" ============================================================================

" Misc UI
call s:HL('ColorColumn',      s:fg_white,     s:bg_dark,         '231', '234')
call s:HL('Conceal',          s:fg_main,      s:bg_main,         '16',  '231')
call s:HL('Cursor',           s:yellow,       s:blue_bright,     '215', '32')
call s:HL('lCursor',          s:fg_white,     s:bg_dark,         '231', '234')
call s:HL('CursorIM',         s:fg_white,     s:bg_dark,         '231', '234')
call s:HL('CursorColumn',     s:fg_white,     s:bg_dark,         '231', '234')
call s:HL('CursorLine',       '',             s:bg_highlight,    '',    '255')
call s:HL('Directory',        s:blue_bright,  '',                '32',  '')
call s:HL('DiffAdd',          s:bg_dark,      s:green_light,     '234', '194')
call s:HL('DiffChange',       s:bg_dark,      s:blue_light,      '234', '153')
call s:HL('DiffDelete',       s:bg_dark,      s:pink_light,      '234', '224')
call s:HL('DiffText',         s:bg_dark,      s:blue_diff,       '234', '153')
call s:HL('EndOfBuffer',      s:fg_grey,      '',                '243', '')
call s:HL('ErrorMsg',         s:red,          s:red_light,       '131', '223')
call s:HL('VertSplit',        s:blue_dark,    s:bg_main,         '17',  '231')
call s:HL('Folded',           s:fg_white,     s:bg_dark,         '231', '234')
call s:HL('FoldColumn',       s:fg_white,     s:bg_dark,         '231', '234')
call s:HL('SignColumn',       s:blue_dark,    s:bg_main,         '17',  '231')
call s:HL('IncSearch',        s:fg_main,      s:yellow,          '16',  '215')
call s:HL('LineNr',           s:blue_dark,    s:bg_main,         '17',  '231')
call s:HL('LineNrAbove',      s:fg_grey_light,'',                '247', '')
call s:HL('LineNrBelow',      s:fg_grey_light,'',                '247', '')
call s:HL('CursorLineNr',     s:blue,         '',                '61',  '')
call s:HL('MatchParen',       s:fg_main,      s:blue_lightest,   '16',  '189')
call s:HL('ModeMsg',          s:fg_main,      s:blue_light,      '16',  '153')
call s:HL('MoreMsg',          s:fg_main,      s:blue_light,      '16',  '153')
call s:HL('NonText',          s:fg_white,     s:blue_light,      '231', '153')

" Popup menu
call s:HL('Pmenu',            s:fg_main,      s:blue_light,      '16',  '153')
call s:HL('PmenuSel',         s:fg_main,      s:bg_lighter,      '16',  '255')
call s:HL('PmenuSbar',        s:fg_main,      s:blue_light,      '16',  '153')
call s:HL('PmenuThumb',       s:blue,         s:blue_light,      '61',  '153')

call s:HL('Question',         s:fg_main,      s:blue_light,      '16',  '153')
call s:HL('QuickFixLine',     s:fg_white,     s:bg_dark,         '231', '234')
call s:HL('Search',           '',             s:yellow_light,    '',    '223')
call s:HL('SpecialKey',       s:blue,         '',                '61',  '')

" Spell checking
call s:HL('SpellBad',         s:red,          s:red_light,       '131', '223')
call s:HL('SpellCap',         s:fg_white,     s:red_light,       '231', '223')
call s:HL('SpellLocal',       s:fg_white,     s:green,           '231', '64')
call s:HL('SpellRare',        s:fg_white,     s:purple,          '231', '97')

" Status line
call s:HL('StatusLine',       s:bg_dark,      s:blue_lighter,    '234', '153')
call s:HL('StatusLineNC',     s:fg_white,     s:bg_grey_dark,    '231', '238')
call s:HL('StatusLineTerm',   s:fg_main,      s:blue_lighter,    '16',  '153')
call s:HL('StatusLineTermNC', s:fg_white,     s:bg_grey_darker,  '231', '238')

" Tabs
call s:HL('TabLine',          s:fg_main,      s:blue_light,      '16',  '153')
call s:HL('TabLineFill',      s:fg_white,     s:blue_light,      '231', '153')
call s:HL('TabLineSel',       s:fg_main,      s:bg_main,         '16',  '231')

call s:HL('Terminal',         s:fg_main,      s:bg_main,         '16',  '231')
call s:HL('Title',            s:blue,         '',                '61',  '')
call s:HL('Visual',           '',             s:blue_light,      '',    '153')
call s:HL('VisualNOS',        s:fg_white,     s:bg_dark,         '231', '234')
call s:HL('WarningMsg',       s:fg_main,      s:blue_light,      '16',  '153')
call s:HL('WildMenu',         s:fg_main,      s:bg_main,         '16',  '231')

" ----------------------------------------------------------------------------
" Modern Neovim UI groups (Neovim 0.4+)
" ----------------------------------------------------------------------------

call s:HL('NormalFloat',      s:fg_main,      s:bg_highlight,    '16',  '255')
call s:HL('FloatBorder',      s:fg_grey,      s:bg_highlight,    '243', '255')
call s:HL('NormalNC',         s:fg_main,      s:bg_main,         '16',  '231')
call s:HL('Whitespace',       s:fg_grey_lighter, '',             '252', '')

" ----------------------------------------------------------------------------
" LSP Diagnostic groups (Neovim 0.6+)
" ----------------------------------------------------------------------------

call s:HL('DiagnosticError',  s:red,          '',                '131', '')
call s:HL('DiagnosticWarn',   s:yellow,       '',                '215', '')
call s:HL('DiagnosticInfo',   s:blue,         '',                '61',  '')
call s:HL('DiagnosticHint',   s:fg_grey,      '',                '243', '')
call s:HL('DiagnosticOk',     s:green,        '',                '64',  '')

" ============================================================================
" SYNTAX HIGHLIGHTING - MAJOR GROUPS
" ============================================================================

call s:HL('Normal',           s:fg_main,      s:bg_main,         '16',  '231')
call s:HL('Comment',          s:red,          '',                '131', '')
call s:HL('Constant',         s:purple,       '',                '97',  '')
call s:HL('Identifier',       s:blue,         '',                '61',  '')
call s:HL('Statement',        s:fg_main,      '',                '16',  '')
call s:HL('PreProc',          s:fg_main,      '',                '16',  '')
call s:HL('Type',             s:fg_main,      '',                '16',  '')
call s:HL('Special',          s:fg_main,      '',                '16',  '')
call s:HL('Underlined',       s:fg_white,     s:bg_dark,         '231', '234')
call s:HL('Ignore',           s:fg_white,     s:bg_dark,         '231', '234')
call s:HL('Error',            s:red,          s:red_light,       '131', '223')
call s:HL('Todo',             s:bg_dark,      s:green_light,     '234', '194')

" ============================================================================
" SYNTAX HIGHLIGHTING - MINOR GROUPS
" ============================================================================

call s:HL('String',           s:green,        '',                '64',  '')
call s:HL('Character',        s:green,        '',                '64',  '')
call s:HL('Number',           s:purple,       '',                '97',  '')
call s:HL('Boolean',          s:purple,       '',                '97',  '')
call s:HL('Float',            s:purple,       '',                '97',  '')
call s:HL('Function',         s:blue,         '',                '61',  '')
call s:HL('Conditional',      s:fg_main,      '',                '16',  '')
call s:HL('Repeat',           s:fg_main,      '',                '16',  '')
call s:HL('Label',            s:fg_main,      '',                '16',  '')
call s:HL('Operator',         s:fg_main,      '',                '16',  '')
call s:HL('Keyword',          s:purple,       '',                '97',  '')
call s:HL('Exception',        s:fg_main,      '',                '16',  '')
call s:HL('Include',          s:fg_main,      '',                '16',  '')
call s:HL('Define',           s:blue,         '',                '61',  '')
call s:HL('Macro',            s:fg_main,      '',                '16',  '')
call s:HL('PreCondit',        s:fg_main,      '',                '16',  '')
call s:HL('StorageClass',     s:fg_main,      '',                '16',  '')
call s:HL('Structure',        s:fg_main,      '',                '16',  '')
call s:HL('Typedef',          s:fg_main,      '',                '16',  '')
call s:HL('SpecialChar',      s:green,        '',                '64',  '')
call s:HL('Tag',              s:blue_bright,  '',                '32',  '')
call s:HL('Delimiter',        s:fg_grey,      '',                '243', '')
call s:HL('SpecialComment',   s:fg_main,      '',                '16',  '')
call s:HL('Debug',            s:fg_main,      '',                '16',  '')

" ============================================================================
" CUSTOM SYNTAX - BRACKETS AND DELIMITERS
" ============================================================================

" Allow users to customize the list of programming languages for custom syntax
if !exists('g:alabaster_prog_languages')
    let g:alabaster_prog_languages = 'bash,c,cpp,css,go,html,java,javascript,php,python,ruby,rust,sh,shell,typescript'
endif

" Apply custom syntax highlighting for brackets and delimiters
augroup alabaster_custom_syntax
    autocmd!
    execute 'autocmd FileType ' . g:alabaster_prog_languages . ' syntax match Brackets "[\\[\\]{}()]"'
    execute 'autocmd FileType ' . g:alabaster_prog_languages . ' syntax match Delimiters "[;]"'
    execute 'autocmd FileType ' . g:alabaster_prog_languages . ' hi Brackets guifg=' . s:fg_grey . ' ctermfg=243'
    execute 'autocmd FileType ' . g:alabaster_prog_languages . ' hi Delimiters guifg=' . s:fg_grey . ' ctermfg=243'
augroup END

" Apply immediately if current buffer matches
if index(split(g:alabaster_prog_languages, ','), &filetype) >= 0
    syntax match Brackets "[\\[\\]{}()]"
    syntax match Delimiters "[;]"
    call s:HL('Brackets', s:fg_grey, '', '243', '')
    call s:HL('Delimiters', s:fg_grey, '', '243', '')
endif

" ============================================================================
" LANGUAGE-SPECIFIC OVERRIDES
" ============================================================================

" ----------------------------------------------------------------------------
" Python
" ----------------------------------------------------------------------------

execute 'hi pythonBoolean  guifg=' . s:purple
execute 'hi pythonConstant guifg=' . s:purple
execute 'hi pythonFunction guifg=' . s:blue . ' guibg=NONE'
execute 'hi pythonQuotes   guifg=' . s:fg_grey
execute 'hi pythonTripleQuotes guifg=' . s:red
execute 'hi pythonBuiltin  guifg=' . s:fg_main

" Assign False, True, and None keywords to the pythonConstant group
" This function ensures consistent application when opening Python files
function! s:ApplyCustomPythonColors()
    syn keyword pythonConstant False True None
endfunction

augroup alabaster_python_custom
    autocmd!
    autocmd FileType python call s:ApplyCustomPythonColors()
augroup END

call s:ApplyCustomPythonColors()

" ----------------------------------------------------------------------------
" reStructuredText (reST) - Documentation format (Sphinx, Python docs)
" ----------------------------------------------------------------------------

" Document Structure
execute 'hi rstSections guifg=' . s:blue . ' guibg=NONE'
execute 'hi rstTransition guifg=' . s:blue . ' guibg=NONE'

" Code & Literals
execute 'hi rstInlineLiteral guifg=' . s:blue . ' guibg=' . s:bg_highlight
execute 'hi rstLiteralBlock guifg=' . s:green . ' guibg=NONE'
execute 'hi rstCodeBlock guifg=' . s:green . ' guibg=NONE'
execute 'hi rstDoctestBlock guifg=' . s:purple . ' guibg=NONE'

" Directives (.. note::, .. warning::, etc.)
execute 'hi rstDirective guifg=' . s:blue . ' guibg=NONE'
execute 'hi rstExDirective guifg=' . s:green . ' guibg=NONE'

" Links & References
execute 'hi rstInterpretedTextOrHyperlinkReference guifg=' . s:blue . ' guibg=' . s:bg_highlight
execute 'hi rstStandaloneHyperlink guifg=' . s:blue_bright . ' guibg=NONE'
execute 'hi rstHyperlinkTarget guifg=' . s:green . ' guibg=NONE'
execute 'hi rstHyperlinkReference guifg=' . s:blue . ' guibg=NONE'

" Citations & Footnotes
execute 'hi rstFootnote guifg=' . s:green . ' guibg=NONE'
execute 'hi rstFootnoteReference guifg=' . s:blue . ' guibg=NONE'
execute 'hi rstCitation guifg=' . s:green . ' guibg=NONE'
execute 'hi rstCitationReference guifg=' . s:blue . ' guibg=NONE'

" Text Formatting
execute 'hi rstEmphasis guifg=' . s:fg_main
execute 'hi rstStrongEmphasis guifg=' . s:fg_main . ' gui=bold cterm=bold'

" Special Elements
execute 'hi rstTodo guifg=' . s:bg_dark . ' guibg=' . s:green_light
execute 'hi rstDelimiter guifg=' . s:fg_grey . ' guibg=NONE'

" ----------------------------------------------------------------------------
" C++/Cpp
" ----------------------------------------------------------------------------

execute 'hi cppConstant guifg=' . s:purple . ' guibg=NONE'
execute 'hi cFunction guifg=' . s:blue . ' guibg=NONE'

" ----------------------------------------------------------------------------
" Markdown
" ----------------------------------------------------------------------------

execute 'hi markdownItalicDelimiter guifg=' . s:red
execute 'hi markdownBlockquote guifg=' . s:green
execute 'hi markdownBold guifg=' . s:red
execute 'hi markdownBoldDelimiter guifg=' . s:red
execute 'hi markdownCode guifg=' . s:blue . ' guibg=' . s:bg_highlight
execute 'hi markdownCodeDelimiter guifg=' . s:fg_grey
execute 'hi markdownFootnote guifg=' . s:purple
execute 'hi markdownHeadingDelimiter guifg=' . s:blue
execute 'hi markdownItalic guifg=' . s:fg_main
execute 'hi markdownLinkDelimiter guifg=' . s:purple
execute 'hi markdownListMarker guifg=' . s:yellow
execute 'hi markdownOrderedListMarker guifg=' . s:yellow
execute 'hi markdownLinkText guifg=' . s:fg_main

" ----------------------------------------------------------------------------
" Bash
" ----------------------------------------------------------------------------

execute 'hi shComment   guifg=' . s:red
execute 'hi shString    guifg=' . s:green
execute 'hi shFunction  guifg=' . s:blue

" ----------------------------------------------------------------------------
" Go
" ----------------------------------------------------------------------------

execute 'hi goDeclaration guifg=' . s:fg_main
execute 'hi goFunction guifg=' . s:blue

" ----------------------------------------------------------------------------
" LaTeX
" ----------------------------------------------------------------------------

execute 'hi texTitleArg guifg=' . s:blue
execute 'hi texStyleItal guifg=' . s:fg_main

" ----------------------------------------------------------------------------
" Llama.vim
" ----------------------------------------------------------------------------

execute 'hi llama_hl_hint guifg=' . s:grey_medium
execute 'hi llama_hl_info guifg=' . s:blue
