if !get(g:, 'loaded_markdown_preview', 0) || !exists('g:nyaovim_version')
    finish
endif

if g:markdown_preview_auto_start
    call markdown_preview#start()
endif

if !g:markdown_preview_no_default_mapping
    nmap <buffer><silent><Leader>gg <Plug>(markdown-preview-scroll-top)
    nmap <buffer><silent><Leader>G <Plug>(markdown-preview-scroll-bottom)
    nmap <buffer><silent><Leader>j <Plug>(markdown-preview-scroll-down)
    nmap <buffer><silent><Leader>k <Plug>(markdown-preview-scroll-up)
endif

command! -nargs=0 StartMarkdownPreview call markdown_preview#start()
command! -nargs=0 StopMarkdownPreview call markdown_preview#stop()
