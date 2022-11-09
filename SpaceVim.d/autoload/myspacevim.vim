
function! myspacevim#before() abort
  let g:vimspector_enable_mappings = 'HUMAN'

let g:vimspector_base_dir=expand('~/.vim/.vimspectorjson')
function! s:read_template_into_buffer(template)
    execute '0r ~/.vim/.vimspectorjson/'.a:template
endfunction
command! -bang -nargs=* LoadVimSpectorJsonTemplate call fzf#run({
            \   'source': 'ls -1 ~/.vim/.vimspectorjson',
            \   'down': 20,
            \   'sink': function('<sid>read_template_into_buffer')
            \ })
noremap <leader>db :tabe .vimspector.json<CR>:LoadVimSpectorJsonTemplate<CR>
sign define vimspectorBP text=☛ texthl=Normal
sign define vimspectorBPDisabled text=☞ texthl=Normal
sign define vimspectorPC text=¶ texthl=SpellBad
endfunction


