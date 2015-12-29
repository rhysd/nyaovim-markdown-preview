function! markdown_preview#start() abort
    augroup plugin-mdprev-watcher
        autocmd!
        autocmd TextChanged,TextChangedI <buffer> call rpcnotify(0, 'markdown-preview:update', join(getline(1, '$'), "\n"))
    augroup END
    call rpcnotify(0, 'markdown-preview:update', join(getline(1, '$'), "\n"))
endfunction

function! markdown_preview#stop() abort
    silent! autocmd! plugin-mdprev-watcher
    call rpcnotify(0, 'markdown-preview:update', '')
endfunction

function! markdown_preview#scroll(direction) abort
    call rpcnotify(0, 'markdown-preview:scroll', a:direction)
endfunction
