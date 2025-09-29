sleep 0.1 && /usr/bin/fastfetch

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

# Check if its a GUI-Terminal-Emulator (Konsole, Gnome-Terminal) or on the tty and ajust theme

if [[ -o interactive ]]; then
  cmdtty_output=$(tty)

  if [[ $cmdtty_output =~ ^/dev/tty ]]; then
    # Running on a real tty (Ctrl+Alt+F1-6)
    # Example prompt setting for redhat style
    PROMPT='%F{red}%n@%m %1~ %#%f '  # Customize as needed
  elif [[ $cmdtty_output =~ ^/dev/pts ]]; then
    # Running inside a terminal emulator
    source ~/.zsh/themes/agnoster.zsh-theme
    setopt promptsubst
  else
    # fallback prompt
    PROMPT='%n@%m %1~ %# '
  fi
fi




bindkey -e  # Use Emacs keybindings (default)
bindkey "\e[3~" delete-char
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

alias ls="ls -A"
alias edit="msedit"
alias zsh="clear && zsh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
