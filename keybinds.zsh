#!/bin/zsh

# Based on https://stackoverflow.com/questions/5407916/zsh-zle-shift-selection

# for my own convenience I explicitly set the signals
#   that my terminal sends to the shell as variables.
#   you might have different signals. you can see what
#   signal each of your keys sends by running `$> cat`
#   and pressing keys (you'll be able to see most keys)
#   also some of the signals sent might be set in your
#   terminal emulator application/program
#   configurations/preferences. finally some terminals
#   have a feature that shows you what signals are sent
#   per key press.
#
# for context, at the time of writing these variables are
#   set for the kitty terminal program, i.e these signals
#   are mostly ones sent by default by this terminal.
export KEY_BACKSPACE='^?'
export KEY_FN_BACKSPACE='^[[3~' # Delete
# export KEY_CMD_BACKSPACE='^[b' # Handled natively
export KEY_FN_CMD_BACKSPACE='^[[3;9~'
export KEY_FN_CMD_BACKSPACE_TMUX='^[ [3;9~'
export KEY_ALT_BACKSPACE='\\x1b\\x7f'
export KEY_FN_ALT_BACKSPACE='^[ d'
export KEY_ALT_F='^ƒ'
export KEY_ALT_B='^∫'
export KEY_ALT_D='^∂'
export KEY_CTRL_U=$'\x15' # ^U
export KEY_CMD_Z=$'^[[122;9u'
export KEY_SHIFT_CMD_Z=$'^[[122;10u'
export KEY_CTRL_R=$'\x12' # ^R
export KEY_CMD_C=$'^[[99;9u'
export KEY_CMD_X=$'^[[120;9u'
export KEY_CMD_V=$'^[[118;9u'
export KEY_CMD_A=$'^[[97;9u'
export KEY_CTRL_L=$'\x0c' # ^L
export KEY_LEFT=$'^[[D'
export KEY_RIGHT=$'^[[C'
export KEY_SHIFT_UP=${terminfo[kri]:-$'^[[1;2A'}
export KEY_SHIFT_DOWN=${terminfo[kind]:-$'^[[1;2B'}
export KEY_SHIFT_RIGHT=${terminfo[kRIT]:-$'^[[1;2C'}
export KEY_SHIFT_LEFT=${terminfo[kLFT]:-$'^[[1;2D'}
export KEY_ALT_LEFT=$'^[b'
export KEY_ALT_RIGHT=$'^[f'
export KEY_SHIFT_ALT_LEFT=$'^[[1;4D'
export KEY_SHIFT_ALT_RIGHT=$'^[[1;4C'
export KEY_CMD_LEFT=$'^[[1;9D'
export KEY_CMD_RIGHT=$'^[[1;9C'
export KEY_SHIFT_CMD_LEFT=$'^[[1;10D'
export KEY_SHIFT_CMD_RIGHT=$'^[[1;10C'
export KEY_CTRL_A=$'\x01' # ^A
export KEY_CTRL_E=$'\x05' # ^E
export KEY_SHIFT_CTRL_A=$'^[[97;6u'
export KEY_SHIFT_CTRL_E=$'^[[101;6u'
export KEY_SHIFT_CTRL_LEFT=$'^[[1;6D'
export KEY_SHIFT_CTRL_RIGHT=$'^[[1;6C'
export KEY_CTRL_D=$'\x04' # ^D

#                       |  key sequence                   | command
# --------------------- | ------------------------------- | -------------

bindkey                   $KEY_ALT_F                        forward-word
bindkey                   $KEY_ALT_B                        backward-word
bindkey                   $KEY_ALT_D                        kill-word
bindkey                   $KEY_ALT_BACKSPACE                kill-word
bindkey                   $KEY_FN_ALT_BACKSPACE             backward-kill-word
bindkey                   $KEY_CTRL_U                       backward-kill-line
bindkey                   $KEY_FN_CMD_BACKSPACE             kill-line
bindkey                   $KEY_FN_CMD_BACKSPACE_TMUX        kill-line
bindkey                   $KEY_SHIFT_RIGHT                  forward-char
bindkey                   $KEY_SHIFT_LEFT                   backward-char
bindkey                   $KEY_SHIFT_ALT_RIGHT              forward-word
bindkey                   $KEY_SHIFT_ALT_LEFT               backward-word
bindkey                   $KEY_SHIFT_CTRL_RIGHT             forward-char
bindkey                   $KEY_SHIFT_CTRL_LEFT              backward-char
bindkey                   $KEY_SHIFT_CMD_RIGHT              end-of-line
bindkey                   $KEY_SHIFT_CMD_LEFT               beginning-of-line
