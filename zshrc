# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!

__conda_setup="$('/Users/king/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/king/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/king/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/king/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias mcreate='minikube start  --registry-mirror=https://registry.docker-cn.com  --image-mirror-country cn --kubernetes-version=v1.23.8'
source ~/.alias

# zsh 插件加载
export ZPLUG_HOME=/opt/homebrew/opt/zplug
source $ZPLUG_HOME/init.zsh

# === History config ===
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt append_history
setopt share_history
setopt long_list_jobs
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_find_no_dups
setopt hist_reduce_blanks
setopt hist_verify
setopt hist_no_store
setopt interactivecomments
zstyle ':completion:*' rehash true




# > === zplug 插件安装 ===
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug "plugins/git",   from:oh-my-zsh
zplug "plugins/tmux",   from:oh-my-zsh
zplug "plugins/safe-paste",   from:oh-my-zsh
zplug "plugins/last-working-dir",   from:oh-my-zsh
zplug "plugins/macosx",   from:oh-my-zsh
zplug "plugins/z",   from:oh-my-zsh
zplug "plugins/d",   from:oh-my-zsh
zplug "plugins/extract",   from:oh-my-zsh
zplug "plugins/git-open",   from:oh-my-zsh
zplug "plugins/sudo",   from:oh-my-zsh
zplug "plugins/cp",   from:oh-my-zsh
zplug "plugins/web-search",   from:oh-my-zsh
zplug "plugins/rand-quote", from:oh-my-zsh
zplug "plugins/history-substring-search",  from:oh-my-zsh
zplug "plugins/command-not-found",   from:oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search"
zplug "lib/completion", from:oh-my-zsh
zplug "plugins/man", from:oh-my-zsh
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "kevinhwang91/fzf-tmux-script",\
    as:command, \
    use:"popup/fzfp",\
    rename-to:fzfp
# fzf 使用git 方式安装到家目录
# 加载插件

zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug load

# > zplug 安装检查
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# > zplug 安装

CASE_SENSITIVE="false"
setopt MENU_COMPLETE
setopt no_list_ambiguous
autoload -Uz compinit && compinit
zstyle ':completion:*' menu yes select
source ~/.fzf.zsh




# 给tmux 设置popup
# https://www.liuvv.com/p/1104a363.html#3-fzf-tmux

if [[ -n $TMUX_PANE ]] && (( $+commands[tmux] )) && (( $+commands[fzfp] )); then
    # fallback to normal fzf if current session name is `floating`
    export TMUX_POPUP_NESTED_FB='test $(tmux display -pF "#{==:#S,floating}") == 1'

    export TMUX_POPUP_WIDTH=80%
fi


COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS

if type complete &>/dev/null; then
  _pm2_completion () {
    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$COMP_CWORD" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           pm2 completion -- "${COMP_WORDS[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -o default -F _pm2_completion pm2
elif type compctl &>/dev/null; then
  _pm2_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       pm2 completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _pm2_completion + -f + pm2
fi
#**##-end-pm2-completion-###

unset SSH_AUTH_SOCK


## 设置自动生成 gitignore
function gi() { curl -sL https://www.gitignore.io/api/\$@ ;}

