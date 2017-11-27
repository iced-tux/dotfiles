source $HOME/git/antigen/antigen.zsh
fpath=($HOME/.zsh/ $HOME/.zsh/completion $fpath)

ZDIR=$HOME/.zsh
ZALIAS=${ZDIR}/zalias
ENV_VARS=${ZDIR}/env_vars
HISTFILE=$HOME/.histfile
HISTSIZE=2000
SAVEHIST=2000
[ -f $ENV_VARS ] && source $ENV_VARS

antigen use oh-my-zsh
antigen bundles <<EOBUNDLES
    colored-man-pages
    history
    vi-mode
    virtualenvwrapper
    zsh-users/zsh-autosuggestions
    zsh-users/zsh-completions
    zsh-users/zsh-syntax-highlighting
EOBUNDLES

antigen apply

[ -f $ZALIAS ] && source $ZALIAS

# Options

setopt AUTO_LIST             # Automatically list choices on an ambiguous completion.
setopt AUTO_MENU             # Automatically use menu completion after the second consecutive request for completion, for example by pressing the tab key repeatedly. This option is overridden by MENU_COMPLETE
setopt COMPLETE_IN_WORD      # If unset, the cursor is set to the end of the word if completion is started. Otherwise it stays there and completion is done from both ends.
setopt CORRECT               # spell check for commands only
setopt HIST_IGNORE_ALL_DUPS  # If a new command line being added to the history list duplicates an older one, the older command is removed from the list (even if it is not the previous event)
setopt HIST_REDUCE_BLANKS    # Remove superfluous blanks from each command line being added to the history list.
setopt HIST_SAVE_NO_DUPS     # When writing out the history file, older commands that duplicate newer ones are omitted.
setopt HIST_VERIFY           # Whenever the user enters a line with history expansion, don't execute the line directly; instead, perform history expansion and reload the line into the editing buffer.
setopt INC_APPEND_HISTORY    # This options works like APPEND_HISTORY except that new history lines are added to the $HISTFILE incrementally (as soon as they are entered), rather than waiting until the shell exits. The file will still be periodically re-written to trim it when the number of lines grows 20% beyond the value specified by $SAVEHIST (see also the HIST_SAVE_BY_COPY option).
setopt LIST_PACKED           # Try to make the completion list smaller (occupying less lines) by printing the matches in columns with different widths.
setopt NO_BG_NICE
setopt NUMERIC_GLOB_SORT     # If numeric filenames are matched by a filename generation pattern, sort the filenames numerically rather than lexicographically.
setopt SHARE_HISTORY         # This option both imports new commands from the history file, and also causes your typed commands to be appended to the history file (the latter is like specifying INC_APPEND_HISTORY). The history lines are also output with timestamps ala EXTENDED_HISTORY (which makes it easier to find the spot where we left off reading the file after it gets re-written).
unset DESTOP_STARTUP_ID
unsetopt BEEP NOTIFY

_force_rehash() {
  (( CURRENT == 1 )) && rehash
  return 1    # Because we didn't really complete anything
}

zstyle ':completion:*' add-space true
zstyle ':completion:*' cache-path $HOME/.zsh/cache
zstyle ':completion:*' file-sort name
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' matcher-original both
zstyle ':completion:*' menu select
zstyle ':completion:*' original true
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' rehash true
# zstyle ':completion:*' special-dirs true
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' verbose true
zstyle ':completion:*:corrections' format "%B--${yellow} %d  (errors %e)${nocolor}--%b"
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*:descriptions' format "%B--${green} %d --%b"
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true
zstyle ':completion:*:messages' format "%B--${green} %d ${nocolor}--%b"
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:warnings' format "%B--${red} no match for: %d ${nocolor}--%b"
zstyle ':completion:::::' completer _force_rehash _complete _approximate
zstyle ':completion:complete:*' use cache 1

## With commands like `rm' it's annoying if one gets offered the same
#filename again even if it is already on the command line. To avoid that:
##
zstyle ':completion:*:(rm|mv|cp|cd):*' ignore-line yes

# Ignore parent directory, e.g cp
zstyle ':completion:*:(cd|mv|cp):*' ignore-parents parent pwd

# Ignore what's already in the line
zstyle ':completion:*:(rm|kill|diff):*' ignore-line yes

# Process Completion
zstyle ':completion:*:*:*:*:processes' menu yes select
zstyle ':completion:*:*:*:*:processes' force-list always
zstyle ':completion:*:processes-names' command  'ps cxwf -u ${USER} -o command | uniq'


if [ "$TERM" = xterm ] || [ "$TERM" = "xterm-256color" ];
then
        bindkey -v
        bindkey "OH" beginning-of-line # Pos1
        bindkey "OF" end-of-line # End
        bindkey "[3~" delete-char # Entf
        bindkey "[1;2A" history-beginning-search-backward # S-Up
        bindkey "[1;2B" history-beginning-search-forward # S-Down
        bindkey "OD" backward-char # Left
        bindkey "OC" forward-char # Right
        bindkey "[1;5C" vi-forward-word # C-Right
        bindkey "[1;5D" vi-backward-word # C-Left
        # bindkey "" vi-backward-kill-word # C-Backspace
        bindkey "[3;5~" kill-word # C-Entf
        bindkey "q" push-line # C-ESC-q
        bindkey "" kill-whole-line # C-u
        bindkey "" vi-change-eol # C-e
        bindkey "" history-incremental-search-backward # C-r
        bindkey "" accept-search # C-a
else
        bindkey -v
        bindkey "[7~" beginning-of-line # Pos1
        bindkey "[8~" end-of-line # End
        bindkey "[3~" delete-char # Entf
        bindkey "[a" history-beginning-search-backward # S-Up
        bindkey "[b" history-beginning-search-forward # S-Down
        bindkey "OD" backward-char # Left
        bindkey "OC" forward-char # Right
        bindkey "Oc" vi-forward-word # C-Right
        bindkey "Od" vi-backward-word # C-Left
        bindkey "" vi-backward-kill-word # C-Backspace
        bindkey "[3^" kill-word # C-Entf
        bindkey "" push-line # C-p
        bindkey "" kill-whole-line # C-u
        bindkey "" vi-change-eol # C-e
        bindkey "" history-incremental-search-backward # C-r
        bindkey "" accept-search # C-a
fi

function powerline_precmd() {
    PS1="$(powerline-shell --shell zsh $?)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi
