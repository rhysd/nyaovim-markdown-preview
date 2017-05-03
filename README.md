Live Markdown Preview in [NyaoVim](https://github.com/rhysd/NyaoVim)
====================================================================

This is a UI plugin to provide live markdown preview UI for [NyaoVim](https://github.com/rhysd/NyaoVim).
Preview is automatically opened/closed on `markdown` filetype and updated in real-time.  [marked](https://github.com/chjj/marked) converts current buffer to HTML and [highlight.js](https://github.com/isagalaev/highlight.js/) adds syntax highlight to code block.

![screenshot](https://raw.githubusercontent.com/rhysd/ss/master/nyaovim-markdown-preview/main.gif)

## Installation

At first, install this repository as normal Neovim plugin with your favorite plugin manager.

Then put `<markdown-preview>` component to your `~/.config/nyaovim/nyaovimrc.html` as below.

```html
<style>
  /* CSS configurations here */
  .horizontal {
    display: flex;
    width: 100%;
    height: 100%;
  }
  neovim-editor {
    width: 100%;
    height: 100%;
  }
</style>

<div class="horizontal">
  <neovim-editor id="nyaovim-editor" argv="[[argv]]"></neovim-editor>
  <!-- Put component -->
  <markdown-preview editor="[[editor]]"></markdown-preview>
</div>
```

Note that this is just an example.  You can put this component as you like.  But I recommend flex layout to use space effectively.

## How to Start Preview

If you set `g:markdown_preview_auto` (default: `1`) to `1`, this plugin automatically starts preview on `markdown` filetype.  Or you can start markdown preview by `:StartMarkdownPreview` commands.

The preview is updated on `TextChanged` by default.  If you want to update more frequently, you can set `g:markdown_preview_eager` to `1`.  If it is set to `1`, the preview is also updated on `TextChangedI`.

If you set `g:markdown_preview_auto` to `1`, it also stops automatically when the markdown document buffer gets hidden or is unloaded.  Or you can stop and dismiss markdown preview by `:StopMarkdownPreview` command manually.  

## Mappings

If you don't set `g:markdown_preview_no_default_mapping` to `1`, this plugin automatically defines some mappings only in `markdown` filetype buffer to scroll preview.

- `<Plug>(markdown-preview-scroll-up)` (default: `<Leader>k`)

Scroll markdown preview up by 3 lines.

- `<Plug>(markdown-preview-scroll-down)` (default: `<Leader>j`)

Scroll markdown preview down by 3 lines.

- `<Plug>(markdown-preview-scroll-top)` (default: `<Leader>gg`)

Scroll markdown preview to top of window.

- `<Plug>(markdown-preview-scroll-bottom)` (default: `<Leader>G`)

Scroll markdown preview to bottom of window.

## `<markdown-preview>` Properties

| Name | Description | Default |
| ---- | ----------- | ------- |
| `expand-width` (`Number`) | Expanding width of window on starting preview. (**optional**) | `undefined` |
| `expand-height` (`Number`) | Expanding height of window on starting preview. (**optional**)| `undefined` |
| `editor` (`Object`) | [Editor instance](https://github.com/rhysd/neovim-component#neovim-editor-apis) of `<neovim-editor`> component (**required**) | `undefined` |

## License

Under MIT license.

```
Copyright (c) 2015 rhysd

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR
THE USE OR OTHER DEALINGS IN THE SOFTWARE.
```

