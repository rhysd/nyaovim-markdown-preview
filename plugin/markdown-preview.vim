if get(g:, 'loaded_markdown_preview', 0) || !exists('g:nyaovim_version')
    finish
endif

function! StartMarkdownPreview() abort
    augroup plugin-mdprev-watcher
        autocmd!
        autocmd TextChanged,TextChangedI <buffer> call rpcnotify(0, 'markdown-preview:update', join(getline(1, '$'), "\n"))
    augroup END
    call rpcnotify(0, 'markdown-preview:update', join(getline(1, '$'), "\n"))
endfunction

function! StopMarkdownPreview() abort
    autocmd! plugin-mdprev-watcher
    call rpcnotify(0, 'markdown-preview:dismiss')
endfunction

if get(g:, 'markdown_preview_auto_start', 1)
    augroup plugin-markdown-preview
        autocmd!
        autocmd FileType markdown call StartMarkdownPreview()
    augroup END
endif

let g:loaded_markdown_preview = 1
