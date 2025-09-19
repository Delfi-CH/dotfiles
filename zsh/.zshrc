# The following lines were added by compinstall
zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' ignore-parents pwd
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/delfi/.zshrc'

# Enable prompt system
autoload -Uz promptinit
promptinit

# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt beep nomatch notify
unsetopt extendedglob
# End of lines configured by zsh-newuser-install

# Locale settings
export LANG=de_CH.UTF-8
export LC_ALL=de_CH.UTF-8

# Theme

# Rudimentary Terraform Setup

tf_prompt_info() {
  # Simple example: show current Terraform workspace if available
  if command -v terraform &>/dev/null; then
    workspace=$(terraform workspace show 2>/dev/null)
    if [[ -n $workspace ]]; then
      echo "[$workspace]"
    fi
  fi
}

parse_git_dirty() {
  [[ $(git status --porcelain 2> /dev/null) != "" ]] && echo "*"
}


source ~/.zsh/themes/agnoster.zsh-theme
setopt promptsubst


bindkey -e  # Use Emacs keybindings (default)
bindkey "\e[3~" delete-char
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

alias ls="ls -A"
