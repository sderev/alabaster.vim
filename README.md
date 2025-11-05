# alabaster.vim

Minimal Vim colorschemes inspired by [tonsky's Alabaster theme](https://github.com/tonsky/sublime-scheme-alabaster). Focus on readability and reduced visual noise.

## Variants

* **alabaster** - Light theme with subtle colors
* **alabaster-bg** - Light theme with background highlighting
* **alabaster-dark** - Dark theme with muted colors
* **alabaster-mono** - Light monochrome
* **alabaster-dark-mono** - Dark monochrome

### alabaster

![alabaster](/assets/images/screenshot_0ab145e5-c335-404b-b93e-3906f42d773c.png)

### alabaster-bg

![alabaster-bg](/assets/images/screenshot_f0a58946-e4b7-417e-8b15-1355e14be6c2.png)

### alabaster-dark

![alabaster-dark](/assets/images/screenshot_7953c90a-03a0-44ff-8531-49ecd401ebfe.png)

### alabaster-dark-mono

![alabaster-dark-mono](/assets/images/screenshot_56d75c05-4ca7-4f66-8752-606301483728.png)

### alabaster-mono

![alabaster-mono](/assets/images/screenshot_59fdc83a-9804-4522-8227-660197446aa5.png)

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
