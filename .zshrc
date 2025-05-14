source ~/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Colored Man Pages
antigen bundle ael-code/zsh-colored-man-pages

# Fzf tab plugin
antigen bundle Aloxaf/fzf-tab

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle pip
antigen bundle command-not-found

# zsh autosuggestions
antigen bundle zsh-users/zsh-autosuggestions

# Zsh Interactive CD
antigen bundle changyuheng/zsh-interactive-cd

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Extra zsh completions
antigen bundle zsh-users/zsh-completions

# Fzf bundle
antigen bundle ohmyzsh/ohmyzsh plugins/fzf

# Zsh colored man pages
antigen bundle ael-code/zsh-colored-man-pages

# Auto Color ls cmd
# antigen bundle gretzky/auto-color-ls

# Load the theme.
antigen theme robbyrussell

# Tell Antigen that you're done.
antigen apply

# PATH
path+=($HOME/.local/bin/ $path)
path+=($HOME/go/bin $path)
export PATH

# Starship Prompt
eval "$(starship init zsh)"

# Alias
alias print_gray="sudo lpr -o outputorder=reverse -o media=A4 -o fit-to-page -o ColorModel=KGray"
alias sd="cd ~ && cd \$(find  * -type d | fzf)"
alias nd="cd ~ && cd \$(dirname \$(rg  --hidden --no-line-number --smart-case  --files | fzf)) && nvim ."
alias vd="cd ~ && code \$(find  * | fzf)"


bindkey -s '^S' "open_tmux_nvim -s^M" 
bindkey -s '^F' "open_tmux_nvim^M" 

# Pyenv
# export PATH="$HOME/.pyenv/bin:$PATH"
# eval "$(pyenv init --path)"
# eval "$(pyenv init -)"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun completions
[ -s "/home/fatih/.bun/_bun" ] && source "/home/fatih/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
