""
" Name:        alabaster-bg.vim
" Description: Background highlighting variant - all text is black, colors on backgrounds.
"              Inspired by tonsky's Alabaster theme.
" Maintainer:  sderev
" License:     MIT
"""

" ============================================================================
" COLOR PALETTE
" ============================================================================

" Base backgrounds
let s:bg_main        = '#fafafa'   " cterm: 231 - Main background (white)
let s:bg_subtle      = '#f0f0f0'   " cterm: 255 - Subtle highlight

" Syntax backgrounds (key feature of BG variant)
let s:bg_string      = '#f1fadf'   " cterm: 194 - Light green for strings
let s:bg_string_esc  = '#dbecb6'   " cterm: 193 - Darker green for escapes
let s:bg_comment     = '#fffabc'   " cterm: 229 - Yellow for comments
let s:bg_definition  = '#dbf1ff'   " cterm: 189 - Light blue for definitions
let s:bg_error       = '#ffe0e0'   " cterm: 224 - Light red for errors

" Accent backgrounds (UI elements)
let s:bg_blue_menu   = '#b4d8fd'   " cterm: 153 - Menus, visual
let s:bg_yellow      = '#ffbc5d'   " cterm: 215 - Search highlight
let s:bg_dark        = '#ebebeb'   " cterm: 253 - Light grey for contrast

" Foreground colors (minimal - mostly black)
let s:fg_black       = '#000000'   " cterm: 16  - All text is black
let s:fg_grey_dark   = '#707070'   " cterm: 243 - Dark grey for punctuation
let s:fg_grey_light  = '#8a8a8a'   " cterm: 245 - Medium grey for nested brackets

" Semantic colors (only for constants in BG variant)
let s:purple         = '#7a3e9d'   " cterm: 97  - Constants (text color, not bg)

" Active/cursor color
let s:blue_bright    = '#007acc'   " cterm: 32  - Links, cursor

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

let g:colors_name='alabaster-bg'
set t_Co=256

" ============================================================================
" UI ELEMENTS
" ============================================================================

call s:HL('ColorColumn',      s:fg_black,     s:bg_dark,       '16',  '253')
call s:HL('Conceal',          s:fg_black,     s:bg_main,       '16',  '231')
call s:HL('Cursor',           s:fg_black,     s:blue_bright,   '16',  '32')
call s:HL('lCursor',          s:fg_black,     s:blue_bright,   '16',  '32')
call s:HL('CursorIM',         s:fg_black,     s:blue_bright,   '16',  '32')
call s:HL('CursorColumn',     '',             s:bg_subtle,     '',    '255')
call s:HL('CursorLine',       '',             s:bg_subtle,     '',    '255')
call s:HL('Directory',        s:blue_bright,  '',              '32',  '')
call s:HL('DiffAdd',          s:fg_black,     s:bg_string,     '16',  '194')
call s:HL('DiffChange',       s:fg_black,     s:bg_blue_menu,  '16',  '153')
call s:HL('DiffDelete',       s:fg_black,     s:bg_error,      '16',  '224')
call s:HL('DiffText',         s:fg_black,     s:bg_definition, '16',  '189')
call s:HL('EndOfBuffer',      s:fg_grey_dark, '',              '243', '')
call s:HL('ErrorMsg',         s:fg_black,     s:bg_error,      '16',  '224')
call s:HL('VertSplit',        s:fg_grey_dark, s:bg_main,       '243', '231')
call s:HL('Folded',           s:fg_black,     s:bg_dark,       '16',  '253')
call s:HL('FoldColumn',       s:fg_black,     s:bg_dark,       '16',  '253')
call s:HL('SignColumn',       s:fg_black,     s:bg_main,       '16',  '231')
call s:HL('IncSearch',        s:fg_black,     s:bg_yellow,     '16',  '215')
call s:HL('LineNr',           s:fg_grey_dark, s:bg_main,       '243', '231')
call s:HL('LineNrAbove',      s:fg_grey_dark, '',              '248', '')
call s:HL('LineNrBelow',      s:fg_grey_dark, '',              '248', '')
call s:HL('CursorLineNr',     s:fg_black,     '',              '16',  '')
call s:HL('MatchParen',       s:fg_black,     s:bg_definition, '16',  '189')
call s:HL('ModeMsg',          s:fg_black,     s:bg_blue_menu,  '16',  '153')
call s:HL('MoreMsg',          s:fg_black,     s:bg_blue_menu,  '16',  '153')
call s:HL('NonText',          s:fg_grey_dark, s:bg_main,       '243', '231')
call s:HL('Pmenu',            s:fg_black,     s:bg_blue_menu,  '16',  '153')
call s:HL('PmenuSel',         s:fg_black,     s:bg_dark,       '16',  '253')
call s:HL('PmenuSbar',        s:fg_black,     s:bg_blue_menu,  '16',  '153')
call s:HL('PmenuThumb',       s:fg_black,     s:bg_dark,       '16',  '253')
call s:HL('Question',         s:fg_black,     s:bg_blue_menu,  '16',  '153')
call s:HL('QuickFixLine',     s:fg_black,     s:bg_dark,       '16',  '253')
call s:HL('Search',           s:fg_black,     s:bg_yellow,     '16',  '215')
call s:HL('SpecialKey',       s:blue_bright,  '',              '32',  '')
call s:HL('SpellBad',         s:fg_black,     s:bg_error,      '16',  '224')
call s:HL('SpellCap',         s:fg_black,     s:bg_error,      '16',  '224')
call s:HL('SpellLocal',       s:fg_black,     s:bg_string,     '16',  '194')
call s:HL('SpellRare',        s:fg_black,     s:bg_comment,    '16',  '229')
call s:HL('StatusLine',       s:fg_black,     s:bg_blue_menu,  '16',  '153')
call s:HL('StatusLineNC',     s:fg_black,     s:bg_dark,       '16',  '253')
call s:HL('StatusLineTerm',   s:fg_black,     s:bg_blue_menu,  '16',  '153')
call s:HL('StatusLineTermNC', s:fg_black,     s:bg_dark,       '16',  '253')
call s:HL('TabLine',          s:fg_black,     s:bg_blue_menu,  '16',  '153')
call s:HL('TabLineFill',      s:fg_black,     s:bg_blue_menu,  '16',  '153')
call s:HL('TabLineSel',       s:fg_black,     s:bg_main,       '16',  '231')
call s:HL('Terminal',         s:fg_black,     s:bg_main,       '16',  '231')
call s:HL('Title',            s:fg_black,     s:bg_definition, '16',  '189')
call s:HL('Visual',           '',             s:bg_blue_menu,  '',    '153')
call s:HL('VisualNOS',        s:fg_black,     s:bg_dark,       '16',  '253')
call s:HL('WarningMsg',       s:fg_black,     s:bg_comment,    '16',  '229')
call s:HL('WildMenu',         s:fg_black,     s:bg_main,       '16',  '231')

" Modern Neovim UI groups (Neovim 0.4+)
call s:HL('NormalFloat',      s:fg_black,     s:bg_blue_menu,  '16',  '153')
call s:HL('FloatBorder',      s:fg_grey_dark, s:bg_blue_menu,  '243', '153')
call s:HL('NormalNC',         s:fg_black,     s:bg_main,       '16',  '231')
call s:HL('Whitespace',       s:fg_grey_dark, '',              '243', '')

" LSP Diagnostic groups (Neovim 0.6+)
call s:HL('DiagnosticError',  s:fg_black,     s:bg_error,      '16',  '224')
call s:HL('DiagnosticWarn',   s:fg_black,     s:bg_comment,    '16',  '229')
call s:HL('DiagnosticInfo',   s:fg_black,     s:bg_definition, '16',  '189')
call s:HL('DiagnosticHint',   s:fg_grey_dark, '',              '243', '')
call s:HL('DiagnosticOk',     s:fg_black,     s:bg_string,     '16',  '194')

" ============================================================================
" SYNTAX HIGHLIGHTING - MAJOR GROUPS
" ============================================================================
" Key principle: All text is black, highlighting via backgrounds

call s:HL('Normal',     s:fg_black, s:bg_main,       '16',  '231')
call s:HL('Comment',    s:fg_black, s:bg_comment,    '16',  '229')
call s:HL('Constant',   s:purple,   '',              '97',  '')
call s:HL('Identifier', s:fg_black, s:bg_definition, '16',  '189')
call s:HL('Statement',  s:fg_black, '',              '16',  '')
call s:HL('PreProc',    s:fg_black, '',              '16',  '')
call s:HL('Type',       s:fg_black, '',              '16',  '')
call s:HL('Special',    s:fg_black, '',              '16',  '')
call s:HL('Underlined', s:fg_black, '',              '16',  '')
call s:HL('Ignore',     s:fg_grey_dark, '',          '243', '')
call s:HL('Error',      s:fg_black, s:bg_error,      '16',  '224')
call s:HL('Todo',       s:fg_black, s:bg_string,     '16',  '194')

" ============================================================================
" SYNTAX HIGHLIGHTING - MINOR GROUPS
" ============================================================================

call s:HL('String',         s:fg_black,     s:bg_string,     '16',  '194')
call s:HL('Character',      s:fg_black,     s:bg_string,     '16',  '194')
call s:HL('Number',         s:purple,       '',              '97',  '')
call s:HL('Boolean',        s:purple,       '',              '97',  '')
call s:HL('Float',          s:purple,       '',              '97',  '')
call s:HL('Function',       s:fg_black,     s:bg_definition, '16',  '189')
call s:HL('Conditional',    s:fg_black,     '',              '16',  '')
call s:HL('Repeat',         s:fg_black,     '',              '16',  '')
call s:HL('Label',          s:fg_black,     '',              '16',  '')
call s:HL('Operator',       s:fg_black,     '',              '16',  '')
call s:HL('Keyword',        s:purple,       '',              '97',  '')
call s:HL('Exception',      s:fg_black,     '',              '16',  '')
call s:HL('Include',        s:fg_black,     '',              '16',  '')
call s:HL('Define',         s:fg_black,     s:bg_definition, '16',  '189')
call s:HL('Macro',          s:fg_black,     '',              '16',  '')
call s:HL('PreCondit',      s:fg_black,     '',              '16',  '')
call s:HL('StorageClass',   s:fg_black,     '',              '16',  '')
call s:HL('Structure',      s:fg_black,     '',              '16',  '')
call s:HL('Typedef',        s:fg_black,     '',              '16',  '')
call s:HL('SpecialChar',    s:fg_black,     s:bg_string_esc, '16',  '193')
call s:HL('Tag',            s:blue_bright,  '',              '32',  '')
call s:HL('Delimiter',      s:fg_grey_dark, '',              '243', '')
call s:HL('SpecialComment', s:fg_black,     s:bg_comment,    '16',  '229')
call s:HL('Debug',          s:fg_black,     '',              '16',  '')

" ============================================================================
" CUSTOM SYNTAX - BRACKETS AND DELIMITERS
" ============================================================================
" Enhanced highlighting for brackets and delimiters.
" By default, applies to programming languages only (not text files like markdown).
" Users can customize by setting g:alabaster_bg_prog_languages.
" Set to empty string '' to apply to ALL filetypes.
" Example: let g:alabaster_bg_prog_languages = 'python,javascript,rust'

" Default programming language list
let s:default_prog_languages = 'bash,c,cpp,css,go,html,java,javascript,php,python,ruby,rust,sh,shell,typescript'

" Allow user customization via g:alabaster_bg_prog_languages
if !exists('g:alabaster_bg_prog_languages')
    let g:alabaster_bg_prog_languages = s:default_prog_languages
endif

function! s:ApplyBracketsAndDelimiters()
    " Apply to all languages if empty, otherwise check if current filetype is in the list
    if g:alabaster_bg_prog_languages == '' || index(split(g:alabaster_bg_prog_languages, ','), &filetype) >= 0
        syntax match Brackets "[\[\]{}()]"
        syntax match Delimiters "[;]"
        execute 'highlight Brackets guifg=' . s:fg_grey_dark . ' ctermfg=243'
        execute 'highlight Delimiters guifg=' . s:fg_grey_dark . ' ctermfg=243'
    endif
endfunction

" Apply on all FileType events
augroup alabaster_bg_custom_syntax
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

execute 'hi pythonBoolean guifg=' . s:purple . ' ctermfg=97'
execute 'hi pythonConstant guifg=' . s:purple . ' ctermfg=97'
execute 'hi pythonFunction guifg=' . s:fg_black . ' guibg=' . s:bg_definition . ' ctermfg=16 ctermbg=189'
execute 'hi pythonQuotes guifg=' . s:fg_grey_dark . ' ctermfg=243'
execute 'hi pythonTripleQuotes guifg=' . s:fg_black . ' guibg=' . s:bg_comment . ' ctermfg=16 ctermbg=229'
execute 'hi pythonBuiltin guifg=' . s:fg_black . ' ctermfg=16'

" Assign False, True, and None keywords from pythonBuiltin to pythonConstant.
" Function ensures consistent application when opening Python files or sourcing .vimrc.
function! s:ApplyCustomPythonColors()
    syn keyword pythonConstant False True None
endfunction

augroup alabaster_bg_python_colors
    autocmd!
    autocmd FileType python call s:ApplyCustomPythonColors()
augroup END

call s:ApplyCustomPythonColors()

" ----------------------------------------------------------------------------
" reStructuredText (reST)
" ----------------------------------------------------------------------------
" Commonly used for documentation (Sphinx, Python docs)

" Document Structure
execute 'hi rstSections guifg=' . s:fg_black . ' guibg=' . s:bg_definition . ' ctermfg=16 ctermbg=189'
execute 'hi rstTransition guifg=' . s:fg_black . ' guibg=' . s:bg_definition . ' ctermfg=16 ctermbg=189'

" Code & Literals
execute 'hi rstInlineLiteral guifg=' . s:fg_black . ' guibg=' . s:bg_definition . ' ctermfg=16 ctermbg=189'
execute 'hi rstLiteralBlock guifg=' . s:fg_black . ' guibg=' . s:bg_string . ' ctermfg=16 ctermbg=194'
execute 'hi rstCodeBlock guifg=' . s:fg_black . ' guibg=' . s:bg_string . ' ctermfg=16 ctermbg=194'
execute 'hi rstDoctestBlock guifg=' . s:purple . ' guibg=NONE ctermfg=97 ctermbg=NONE'

" Directives (.. note::, .. warning::, etc.)
execute 'hi rstDirective guifg=' . s:fg_black . ' guibg=' . s:bg_definition . ' ctermfg=16 ctermbg=189'
execute 'hi rstExDirective guifg=' . s:fg_black . ' guibg=' . s:bg_string . ' ctermfg=16 ctermbg=194'

" Links & References
execute 'hi rstInterpretedTextOrHyperlinkReference guifg=' . s:fg_black . ' guibg=' . s:bg_definition . ' ctermfg=16 ctermbg=189'
execute 'hi rstStandaloneHyperlink guifg=' . s:blue_bright . ' guibg=NONE ctermfg=32 ctermbg=NONE'
execute 'hi rstHyperlinkTarget guifg=' . s:fg_black . ' guibg=' . s:bg_string . ' ctermfg=16 ctermbg=194'
execute 'hi rstHyperlinkReference guifg=' . s:fg_black . ' guibg=' . s:bg_definition . ' ctermfg=16 ctermbg=189'

" Citations & Footnotes
execute 'hi rstFootnote guifg=' . s:fg_black . ' guibg=' . s:bg_string . ' ctermfg=16 ctermbg=194'
execute 'hi rstFootnoteReference guifg=' . s:fg_black . ' guibg=' . s:bg_definition . ' ctermfg=16 ctermbg=189'
execute 'hi rstCitation guifg=' . s:fg_black . ' guibg=' . s:bg_string . ' ctermfg=16 ctermbg=194'
execute 'hi rstCitationReference guifg=' . s:fg_black . ' guibg=' . s:bg_definition . ' ctermfg=16 ctermbg=189'

" Text Formatting
execute 'hi rstEmphasis guifg=' . s:fg_black . ' ctermfg=16'
execute 'hi rstStrongEmphasis guifg=' . s:fg_black . ' gui=bold cterm=bold ctermfg=16'

" Special Elements
execute 'hi rstTodo guifg=' . s:fg_black . ' guibg=' . s:bg_string . ' ctermfg=16 ctermbg=194'
execute 'hi rstDelimiter guifg=' . s:fg_grey_dark . ' guibg=NONE ctermfg=243 ctermbg=NONE'

" ----------------------------------------------------------------------------
" C/C++
" ----------------------------------------------------------------------------

execute 'hi cppConstant guifg=' . s:purple . ' ctermfg=97 guibg=NONE ctermbg=NONE'
execute 'hi cFunction guifg=' . s:fg_black . ' guibg=' . s:bg_definition . ' ctermfg=16 ctermbg=189'

" ----------------------------------------------------------------------------
" Markdown
" ----------------------------------------------------------------------------

execute 'hi markdownItalicDelimiter guifg=' . s:fg_black . ' guibg=' . s:bg_comment . ' ctermfg=16 ctermbg=229'
execute 'hi markdownBlockquote guifg=' . s:fg_black . ' guibg=' . s:bg_string . ' ctermfg=16 ctermbg=194'
execute 'hi markdownBold guifg=' . s:fg_black . ' ctermfg=16'
execute 'hi markdownBoldDelimiter guifg=' . s:fg_grey_dark . ' ctermfg=243'
execute 'hi markdownCode guifg=' . s:fg_black . ' guibg=' . s:bg_definition . ' ctermfg=16 ctermbg=189'
execute 'hi markdownCodeDelimiter guifg=' . s:fg_grey_dark . ' ctermfg=243'
execute 'hi markdownFootnote guifg=' . s:purple . ' ctermfg=97'
execute 'hi markdownHeadingDelimiter guifg=' . s:fg_black . ' guibg=' . s:bg_definition . ' ctermfg=16 ctermbg=189'
execute 'hi markdownItalic guifg=' . s:fg_black . ' ctermfg=16'
execute 'hi markdownLinkDelimiter guifg=' . s:purple . ' ctermfg=97'
execute 'hi markdownListMarker guifg=' . s:fg_black . ' ctermfg=16'
execute 'hi markdownOrderedListMarker guifg=' . s:fg_black . ' ctermfg=16'
execute 'hi markdownLinkText guifg=' . s:fg_black . ' ctermfg=16'

" ----------------------------------------------------------------------------
" Bash/Shell
" ----------------------------------------------------------------------------

execute 'hi shComment guifg=' . s:fg_black . ' guibg=' . s:bg_comment . ' ctermfg=16 ctermbg=229'
execute 'hi shString guifg=' . s:fg_black . ' guibg=' . s:bg_string . ' ctermfg=16 ctermbg=194'
execute 'hi shFunction guifg=' . s:fg_black . ' guibg=' . s:bg_definition . ' ctermfg=16 ctermbg=189'

" ----------------------------------------------------------------------------
" Go
" ----------------------------------------------------------------------------

execute 'hi goDeclaration guifg=' . s:fg_black . ' ctermfg=16'
execute 'hi goFunction guifg=' . s:fg_black . ' guibg=' . s:bg_definition . ' ctermfg=16 ctermbg=189'

" ----------------------------------------------------------------------------
" LaTeX
" ----------------------------------------------------------------------------

execute 'hi texTitleArg guifg=' . s:fg_black . ' guibg=' . s:bg_definition . ' ctermfg=16 ctermbg=189'
execute 'hi texStyleItal guifg=' . s:fg_black . ' ctermfg=16'

" ----------------------------------------------------------------------------
" Llama.vim
" ----------------------------------------------------------------------------

execute 'hi llama_hl_hint guifg=' . s:fg_grey_dark . ' ctermfg=243'
execute 'hi llama_hl_info guifg=' . s:fg_black . ' guibg=' . s:bg_definition . ' ctermfg=16 ctermbg=189'
