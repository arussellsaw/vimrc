call plug#begin()
	Plug 'dracula/vim', { 'name': 'dracula' }
	Plug 'preservim/nerdtree'
	Plug 'neovim/nvim-lspconfig'
	Plug 'nvim-lua/lsp-status.nvim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'airblade/vim-gitgutter'
	Plug 'vim-airline/vim-airline'
	Plug 'nvim-lua/plenary.nvim'

	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-cmdline'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'hrsh7th/cmp-vsnip'
	Plug 'hrsh7th/vim-vsnip'

	Plug 'sebdah/vim-delve'

	Plug 'jose-elias-alvarez/null-ls.nvim'
	Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
call plug#end()


"" basic setup -----
set number
set clipboard=unnamed
set mouse=a
set cursorline
set sts=2
set ts=2
set sw=2
set ignorecase

let mapleader = ","
"" -----------------

"" colors ----------
set termguicolors
syntax enable
colorscheme dracula
highlight Normal ctermbg=NONE guibg=NONE
highlight CursorLine ctermbg=black guibg=black
highlight LspDiagnosticsDefaultInformation ctermfg=DarkCyan guifg=#3c858f
highlight LspDiagnosticsDefaultWarning ctermfg=DarkYellow guifg=#a87207
highlight LspDiagnosticsDefaultError ctermfg=DarkRed guifg=#c94f5b
highlight LspDiagnosticsDefaultHint ctermfg=DarkMagenta guifg=#7b5282
highlight WarningMsg ctermfg=DarkRed guifg=#c94f5b
"" -----------------

"" NERDTree -------
let NERDTreeQuitOnOpen=1
let NERDTreeIgnore = ['\.pyc$', '.DS_STORE']
map <leader>n :NERDTreeToggle<CR>
map <leader>m :NERDTreeFind<CR>
"" -----------------

"" LSP -------------
lua require('completion')
lua require('lsp')

set signcolumn=yes

nnoremap <silent> g[ <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap <silent> g] <cmd>lua vim.diagnostic.goto_next()<CR>
nnoremap <silent> <leader>d <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <leader>q <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <leader>w <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> <leader>k     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>R    <cmd>lua vim.lsp.buf.references()<CR>
"" -----------------

"" treesitter ------
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
  },
}
EOF
"" -----------------

"" go --------------
autocmd BufWritePre *.go lua goimports(1000)
map <leader>b :DlvToggleBreakpoint<CR>
"" -----------------

