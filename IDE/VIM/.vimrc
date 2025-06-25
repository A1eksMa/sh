" then you could press <F9> to execute the current buffer with python 
"autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
"autocmd FileType python imap<buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" move between windows
nnoremap <C-j> <c-w>j
nnoremap <C-k> <c-w>k
nnoremap <C-h> <c-w>h
nnoremap <C-l> <c-w>l 

"Настройки табов для Python, согласно рекоммендациям 
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab         " ставим табы пробелами
set softtabstop=4     "4 пробела в табе

"Автоотступ
set autoindent 

"Подсвечиваем все что можно подсвечивать 
syntax on                              " включить подсветку кода 
set tags+=$HOME/home/sky/.vim/pack/vimplugs/start/ctags 
let python_highlight_all = 1

"Включаем 256 цветов в терминале 
set t_Co=256

"Включаем распознавание типов файлов и типо-специфичные плагины: 
filetype on 
filetype plugin on

set nocompatible              " врубаем режим совместимости с VI 
set enc=utf-8                 " utf-8 по дефолту в файлах 
set ls=2                      " всегда показываем статусбар 
set incsearch                 " инкреминтируемый поиск 
set hlsearch                  " подсветка результатов поиска 
set nu                        " показывать номера строк 
set scrolloff=5               " 5 строк при скролле за раз 

"Перед сохранением вырезаем пробелы на концах (только в .py файлах) 
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``

"----------------- Colorsheme -----------------------------" 
colorscheme codeschool

"----------------- Pydiction -----------------------------" 
let g:pydiction_location = '/home/sky/.vim/pack/vimplugs/start/Pydiction/complete-dict' 

"----------------- Airline -----------------------------" 
"let g:airline_statusline_ontop = 1 " Разместить строку состояния сверху 
let g:airline_powerline_fonts = 1 " включить поддержку Powerline шрифтов 
"let g:airline#extensions#keymap#enabled = 0 " не показывать текущий маппинг 
"let g:airline_section_z = "ue0a1:%l/%L Col:%c" " кастомная графа положения курсора 
let g:Powerline_symbols='unicode' " поддержка unicode 
"let g:airline#extensions#xkblayout#enabled = 0 " 
"set laststatus=2 let g:airline_theme='simple' 
"let g:airline_theme='badwolf' 
"let g:airline#extensions#tabline#enabled = 1 
"let g:airline#extensions#tabline#formatter = 'unique_tail' 
"Otherwise you can change the separator by editing your vimrc, personally I have the following: 
let g:airline_left_sep = ' ' 
let g:airline_left_alt_sep = ' ' 
let g:airline_right_sep = ' ' 
let g:airline_right_alt_sep = ' ' 

"----------------- Py-Mode -----------------------------" 
let g:pymode_python = 'python3' 

" Библиотека Rope (рефакторинг кода и автокомплит) 
let g:pymode_rope = 1
"более умные подсказки по методам класса после ввода точки или после нажатия установленных горячих клавиш 
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0

" Включаем поиск ошибок 
let g:pymode_lint = 0

" Какие ошибки подсвечивать 
let g:pymode_lint_checker = "pyflakes,pep8" 

" Отключаем надоедливое окно, отображающее ошибки и предупреждения 
let g:pymode_lint_cwindow = 0

" Bключает / отключает проверку при каждом сохранении файла 
let g:pymode_lint_on_write = 0

" Bключает / выключает проверку кода "на лету", т.е. по мере набора текста программы 
let g:pymode_lint_on_fly = 0

" Включаем поддержку virtualenv 
let g:pymode_virtualenv = 1 

" Подсветка синтаксиса и ошибок 
let g:pymode_syntax = 1 
let g:pymode_syntax_all = 1 
let g:pymode_syntax_indent_errors = g:pymode_syntax_all 
let g:pymode_syntax_space_errors = g:pymode_syntax_all 

" Отключаем фолдинг 
let g:pymode_folding = 0

"----------------- TagBar -----------------------------" 
map <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 0 " автофокус на Tagbar при открытии

"----------------- NerdTree -----------------------------" 
" показать NERDTree на F3 
map <F3> :NERDTreeToggle<CR> 

"игноррируемые файлы с расширениями
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']
