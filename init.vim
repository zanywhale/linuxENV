"For mac"
set nu
set autoindent
set cindent
set smartindent
set ts=2
set sts=2
set shiftwidth=2
set expandtab
set laststatus=2 " 상태바 표시를 항상한다
set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\
bel sp 50 | resize 10 | terminal
if has('nvim')
    :tnoremap ˙ <C-\><C-n><C-w>h
    :tnoremap ∆ <C-\><C-n><C-w>j
    :tnoremap ˚ <C-\><C-n><C-w>k
    :tnoremap ¬ <C-\><C-n><C-w>l
endif
:nnoremap ˙ <C-w>h
:nnoremap∆  <C-w>j
:nnoremap˚  <C-w>k
:nnoremap ¬ <C-w>l
