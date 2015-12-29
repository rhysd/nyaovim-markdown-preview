if get(g:, 'loaded_markdown_preview', 0) || !exists('g:nyaovim_version')
    finish
endif

augroup plugin-markdown-preview
    autocmd!
augroup END

let g:markdown_preview_auto = get(g:, 'markdown_preview_auto', 1)
let g:markdown_preview_no_default_mapping = get(g:, 'markdown_preview_no_default_mapping', 0)

nnoremap <silent><Plug>(markdown-preview-scroll-up) :<C-u>call markdown_preview#scroll('up')<CR>
nnoremap <silent><Plug>(markdown-preview-scroll-down) :<C-u>call markdown_preview#scroll('down')<CR>
nnoremap <silent><Plug>(markdown-preview-scroll-top) :<C-u>call markdown_preview#scroll('top')<CR>
nnoremap <silent><Plug>(markdown-preview-scroll-bottom) :<C-u>call markdown_preview#scroll('bottom')<CR>

let g:loaded_markdown_preview = 1
