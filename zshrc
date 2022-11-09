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
zplug "plugins/osx",   from:oh-my-zsh
zplug "plugins/vscode",   from:oh-my-zsh
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
zplug "voronkovich/gitignore.plugin.zsh"
zplug "zsh-users/zsh-history-substring-search"
zplug "lib/completion", from:oh-my-zsh
zplug "plugins/man", from:oh-my-zsh
zplug "plugins/colored-man-pages", from:oh-my-zsh
#zplug "junegunn/fzf"
#zplug "junegunn/fzf-bin", \
#    from:gh-r, \
#    as:command, \
#    rename-to:fzf, \
#    use:"*linux*amd64*"
source $ZPLUG_HOME/repos/junegunn/fzf/shell/completion.zsh
source $ZPLUG_HOME/repos/junegunn/fzf/shell/key-bindings.zsh






# > zplug 安装检查
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# > zplug 安装
zplug load




[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
