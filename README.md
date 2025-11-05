# alabaster.vim

Minimal Vim colorschemes inspired by [tonsky's Alabaster theme](https://github.com/tonsky/sublime-scheme-alabaster). Focus on readability and reduced visual noise.

## Variants

* **alabaster** - Light theme with subtle colors
* **alabaster-bg** - Light theme with background highlighting
* **alabaster-dark** - Dark theme with muted colors
* **alabaster-mono** - Light monochrome
* **alabaster-dark-mono** - Dark monochrome

## Requirements

* Vim 8+ or Neovim
* Terminal with true color support (or GUI Vim/Neovim)

## Installation

### Using vim-plug

Add to your `.vimrc` or `init.vim`:

```vim
call plug#begin()
Plug 'sderev/alabaster.vim'
call plug#end()

syntax enable
set termguicolors

colorscheme alabaster
" Available variants: alabaster-bg, alabaster-dark, alabaster-mono, alabaster-dark-mono
```

Then run `:PlugInstall` in Vim.

### Manual installation

```bash
mkdir -p ~/.vim/colors
cp /path/to/alabaster.vim/colors/*.vim ~/.vim/colors/
```

Add to your `.vimrc`:

```vim
syntax enable
set termguicolors

colorscheme alabaster
```
