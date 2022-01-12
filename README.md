# vim-minigo

This is a minimal version of [vim-go](https://github.com/fatih/vim-go). I removed all LSP code, because [coc.nvim](https://github.com/neoclide/coc.nvim) has already provided full LSP support for Go. If vim-go and coc.nvim are used together, two gopls processes will be started, resulting in a waste of resources.

You might ask, why not just use coc.nvim directly? Since coc.nvim lacks some customized support for Go, such as enhanced syntax highlight, invocation of some Go tools, etc.

With this plugin, you can use LSP support provided by coc.nvim; syntax highlight and Go tools provided by vim-go.

## Install

The same as vim-go, you might need to install some Go tools, here is the full list:

```shell
go install github.com/klauspost/asmfmt/cmd/asmfmt@latest
go install github.com/go-delve/delve/cmd/dlv@latest
go install github.com/kisielk/errcheck@latest
go install github.com/davidrjenni/reftools/cmd/fillstruct@latest
go install github.com/rogpeppe/godef@latest
go install golang.org/x/tools/cmd/goimports@latest
go install golang.org/x/lint/golint@latest
go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
go install github.com/fatih/gomodifytags@latest
go install golang.org/x/tools/cmd/gorename@latest
go install github.com/jstemmer/gotags@latest
go install golang.org/x/tools/cmd/guru@latest
go install github.com/josharian/impl@latest
go install honnef.co/go/tools/cmd/keyify@latest
go install github.com/fatih/motion@latest
go install github.com/koron/iferr@latest
```

## Configuration

The same as vim-go, here is mine:

```vim
" Syntax highlight
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_generate_tags = 1

" Automatic GoFmt on :w
autocmd BufWriteCmd *.go call go#fmt#Format(1)
autocmd FileType go call go#config#FmtFailSilently()

" Syntax highlight for go.mod and go.sum
au BufReadPost go.mod set syntax=gomod
au BufReadPost go.sum set syntax=gosum

" Code folding, use 'za' to trigger
autocmd FileType go call go#config#FoldEnable()
autocmd FileType go setlocal foldmethod=syntax
autocmd FileType go setlocal foldlevel=99  " DONOT fold after starting

" Go tools
autocmd FileType go nnoremap gat :GoAddTags 
autocmd FileType go nnoremap grt :GoRemoveTags 
autocmd FileType go nnoremap gi  :GoImports<CR>
autocmd FileType go nnoremap gfs :GoFillStruct<CR>
```