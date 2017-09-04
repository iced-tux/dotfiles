#!/usr/bin/zsh
# -*- mode: shell-script -*-
# The following lines were added by compinstall
# Last-modified: 2017-08-06 So 10:33:51

## Load Aliases and Prompt
fpath=($HOME/.zsh/ $HOME/.zsh/completion $fpath)

ZDIR=$HOME/.zsh
ZALIAS=${ZDIR}/zalias
ENV_VARS=${ZDIR}/env_vars

[ -f $ZALIAS ] && source $ZALIAS
[ -f $ENV_VARS ] && source $ENV_VARS

# Options

## Completion
setopt ALWAYS_LAST_PROMPT    # If unset, key functions that list completions try to return to the last prompt if given a numeric argument. If set these functions try to return to the last prompt if given no numeric argument.
setopt AUTO_LIST             # Automatically list choices on an ambiguous completion.
setopt AUTO_MENU             # Automatically use menu completion after the second consecutive request for completion, for example by pressing the tab key repeatedly. This option is overridden by MENU_COMPLETE
#setopt AUTO_REMOVE_SLASH    # When the last character resulting from a completion is a slash and the next character typed is a word delimiter, a slash, or a character that ends a command (such as a semicolon or an ampersand), remove the slash.
setopt LIST_PACKED           # Try to make the completion list smaller (occupying less lines) by printing the matches in columns with different widths.

## Changing Directories
#setopt AUTOCD               # If a command is issued that can't be executed as a normal command, and the command is the name of a directory, perform the cd command to that directory.
setopt AUTO_PUSHD            # Make cd push the old directory onto the directory stack.

##Expansion and Globbing
#setopt CSH_NULL_GLOB        # If a pattern for filename generation has no matches, delete the pattern from the argument list; do not report an error unless all the patterns in a command have no matches. Overrides NOMATCH.
setopt EXTENDED_GLOB         # Treat the `#', `~' and `^' characters as part of patterns for filename generation, etc. (An initial unquoted `~' always produces named directory expansion.)
#setopt GLOB_COMPLETE        # When the current word has a glob pattern, do not insert all the words resulting from the expansion but generate matches as for completion and cycle through them like MENU_COMPLETE. The matches are generated as if a `*' was added to the end of the word, or inserted at the cursor when COMPLETE_IN_WORD is set.  This actually uses pattern matching, not globbing, so it works not only for files but for any completion, such as options, user names, etc.  Note  that  when  the pattern matcher is used, matching control (for example, case-insensitive or anchored matching) cannot be used.  This limitation only applies when the current word contains a pattern; simply turning on the GLOB_COMPLETE option does not have this effect.
setopt NUMERIC_GLOB_SORT     # If numeric filenames are matched by a filename generation pattern, sort the filenames numerically rather than lexicographically.

## Completion
setopt AUTO_PARAM_KEYS       # If a parameter name was completed and a following character (normally a space) automatically inserted, and the next character typed is one of those that have to come directly after the name (like `}', `:', etc.), the automatically added character is deleted, so that the character typed comes immediately after the parameter name. Completion in a brace expansion is affected similarly: the added character is a `,', which will be removed if `}' is typed next
setopt AUTO_PARAM_SLASH      # If a parameter is completed whose content is the name of a directory, then add a trailing slash instead of a space.
setopt COMPLETE_IN_WORD      # If unset, the cursor is set to the end of the word if completion is started. Otherwise it stays there and completion is done from both ends.

## History
setopt HIST_IGNORE_ALL_DUPS  # If a new command line being added to the history list duplicates an older one, the older command is removed from the list (even if it is not the previous event)
setopt HIST_REDUCE_BLANKS    # Remove superfluous blanks from each command line being added to the history list.
setopt HIST_SAVE_NO_DUPS     # When writing out the history file, older commands that duplicate newer ones are omitted.
setopt HIST_VERIFY           # Whenever the user enters a line with history expansion, don't execute the line directly; instead, perform history expansion and reload the line into the editing buffer.
setopt INC_APPEND_HISTORY    # This options works like APPEND_HISTORY except that new history lines are added to the $HISTFILE incrementally (as soon as they are entered), rather than waiting until the shell exits. The file will still be periodically re-written to trim it when the number of lines grows 20% beyond the value specified by $SAVEHIST (see also the HIST_SAVE_BY_COPY option).
setopt SHARE_HISTORY         # This option both imports new commands from the history file, and also causes your typed commands to be appended to the history file (the latter is like specifying INC_APPEND_HISTORY). The history lines are also output with timestamps ala EXTENDED_HISTORY (which makes it easier to find the spot where we left off reading the file after it gets re-written).

setopt correct               # spell check for commands only

## Input/Output
#setopt PATH_DIRS            # Perform a path search even on command names with slashes in them. Thus if `/usr/local/bin' is in the user's path, and he or she types `X11/xinit', the command `/usr/local/bin/X11/xinit' will be executed (assuming it exists). Commands explicitly beginning with `/', `./' or `../' are not subject to the path search. This also applies to the `.' builtin. Note that subdirectories of the current directory are always searched for executables specified in this form. This takes place before any search indicated by this option, and regardless of whether `.' or the current directory appear in the command search path.
# setopt PRINT_EXIT_VALUE    # Print the exit value of programs with non-zero exit status.

## Script and Functions
setopt MULTIOS               # Perform implicit tees or cats when multiple redirections are attempted

## Misc
setopt NO_BG_NICE
unset DESTOP_STARTUP_ID
unsetopt BEEP NOTIFY

_force_rehash() {
  (( CURRENT == 1 )) && rehash
  return 1    # Because we didn't really complete anything
}

zstyle :compinstall filename "$HOME/.zshrc"
zstyle ':completion:*' add-space true
zstyle ':completion:*' cache-path $HOME/.zsh/cache
zstyle ':completion:::::' completer _force_rehash _complete _approximate
zstyle ':completion:complete:*' use cache 1
# ignore completion functions
zstyle ':completion:*:functions' ignored-patterns '_*'
#zstyle ':completion:*:corrections' format "- %d - (errors %e})"
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
#zstyle ':completion:*:descriptions' format "- %d -"
#---test
zstyle ':completion:*:descriptions' format "%B--${green} %d --%b"
zstyle ':completion:*:messages' format "%B--${green} %d ${nocolor}--%b"
zstyle ':completion:*:warnings' format "%B--${red} no match for: %d ${nocolor}--%b"
zstyle ':completion:*:corrections' format "%B--${yellow} %d  (errors %e)${nocolor}--%b"
#---test
zstyle ':completion:*' file-sort name
zstyle ':completion:*' glob 1
zstyle ':completion:*' group-name ''
#zstyle ':completion:*' ignore-parents parent pwd ..
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:manuals.(^1*)' insert-sections true
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' matcher-original both
zstyle ':completion:*' menu select
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*' original true
zstyle ':completion:*' preserve-prefix '//[^/]##/'
#zstyle ':completion:*' prompt 'Korrektur von %e Fehlern liefert:'
#zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' squeeze-slashes true
#zstyle ':completion:*' substitute 1
zstyle ':completion:*' verbose true
#zstyle -e ':completion:*:completion:approximate:*' max-errors 'reply=( $(( ($#PRFIX + $#SUFFIX) / 3 )) )'


## With commands like `rm' it's annoying if one gets offered the same
#filename again even if it is already on the command line. To avoid that:
##
zstyle ':completion:*:(rm|mv|cp|cd):*' ignore-line yes

autoload -Uz compinit
compinit -i

# Ignore parent directory, e.g cp
zstyle ':completion:*:(cd|mv|cp):*' ignore-parents parent pwd

# Ignore what's already in the line
zstyle ':completion:*:(rm|kill|diff):*' ignore-line yes

# Process Completion
zstyle ':completion:*:*:*:*:processes' menu yes select
zstyle ':completion:*:*:*:*:processes' force-list always
zstyle ':completion:*:processes-names' command  'ps cxwf -u ${USER} -o command | uniq'

## SSH completion
if [[ -f $HOME/.ssh/known_hosts ]]; then
    _myhosts=( ${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[0-9]*}%%\ *}%%,*} )
    zstyle ':completion:*' hosts $_myhosts
fi

function powerline_precmd() {
    PS1="$(~/bin/powerline-shell.py $? --shell zsh 2> /dev/null)"
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

# Edit command line in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

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

autoload run-help

HISTFILE=$HOME/.histfile
HISTSIZE=2000
SAVEHIST=2000


#if [ -x $(which keychain) ]; then
#   eval $(keychain --eval --agents ssh -Q id_rsa)
#fi
# Run on new shell
if [ $UID != 0 ] && [ `which cowsay` ] && [ `which fortune` ]; then
    echo ""
    cowsay $(fortune)
    echo ""
fi
