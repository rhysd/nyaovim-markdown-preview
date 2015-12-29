if get(g:, 'loaded_markdown_preview', 0) || !exists('g:nyaovim_version')
    finish
endif

let s:save_cpo = &cpo
set cpo&vim

function! StartMarkdownPreview() abort
    augroup plugin-mdprev-watcher
        autocmd!
        autocmd TextChanged,TextChangedI <buffer> call rpcnotify(0, 'markdown-preview:update', join(getline(1, '$'), "\n"))
    augroup END
    call rpcnotify(0, 'markdown-preview:update', join(getline(1, '$'), "\n"))
endfunction

function! StopMarkdownPreview() abort
    silent! autocmd! plugin-mdprev-watcher
    call rpcnotify(0, 'markdown-preview:dismiss')
endfunction

augroup plugin-markdown-preview
    autocmd!
augroup END

if get(g:, 'markdown_preview_auto_start', 1)
    autocmd plugin-markdown-preview FileType markdown call StartMarkdownPreview()
endif

function ScrollMarkdownPreview(direction) abort
    call rpcnotify(0, 'markdown-preview:scroll', a:direction)
endfunction

nnoremap <silent><Plug>(markdown-preview-scroll-up) :<C-u>call ScrollMarkdownPreview('up')<CR>
nnoremap <silent><Plug>(markdown-preview-scroll-down) :<C-u>call ScrollMarkdownPreview('down')<CR>
nnoremap <silent><Plug>(markdown-preview-scroll-top) :<C-u>call ScrollMarkdownPreview('top')<CR>
nnoremap <silent><Plug>(markdown-preview-scroll-bottom) :<C-u>call ScrollMarkdownPreview('bottom')<CR>

if !get(g:, 'markdown_preview_no_default_mapping', 0)
    autocmd plugin-markdown-preview FileType markdown nmap <buffer><silent><Leader>gg <Plug>(markdown-preview-scroll-top)|
            \ nmap <buffer><silent><Leader>G <Plug>(markdown-preview-scroll-bottom)|
            \ nmap <buffer><silent><Leader>j <Plug>(markdown-preview-scroll-down)|
            \ nmap <buffer><silent><Leader>k <Plug>(markdown-preview-scroll-up)
endif

let &cpo = s:save_cpo
unlet s:save_cpo

let g:loaded_markdown_preview = 1
