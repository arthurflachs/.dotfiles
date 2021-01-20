# New vim config

Trying to re-build my vim config from scratch so that :
* It finally works smoothly with TS
* I understand what I install, what is going on, etc...
* I get an even better experience

## Step by step

### First step

**Get back to my usual shortcuts**

* Using jk (and kj) instead of escape to quit insert mode
* Disable arrows

### 2. Install vim-plug

Need some plugins...

### 3. Add some indentation rules

Spaces over tabs
4 spaces by default

### 4. JS and TS do not have the same color highlighting

![js and ts color highlighting differences](/doc/assets/vim/2021-01-18-ts-js-hi-differences.png)

Apart from when there is an actual difference, there is no reason the syntax highlighting should be different between the two.

**Understanding vim's syntax**

The syntax highlighting is enabled in vim with the command

```
:syntax enable
```

This is actually a shortcut which executes

```
:source $VIMRUNTIME/syntax/syntax.vim
```

There are syntaxes defined for each filetype. For instance : `$VIMRUNTIME/syntax/javascript.vim`.

**Going further**

Follow this guide : [Learn vimscript the hard way - Syntax Highlighting](https://learnvimscriptthehardway.stevelosh.com/chapters/45.html)

**Choosing a syntax file for Javascript**

The basic javascript syntax on nvim is quite poor :

![default js syntax vim](/doc/assets/vim/2021-01-19-basic-nvim.png)

I choose to use pangloss/vim-javascript

![pangloss javascript syntax](/doc/assets/vim/2021-01-19-pangloss.png)

### 5. Install gruvbox theme

### 6. Add MaxMEllon/vim-jsx-pretty
