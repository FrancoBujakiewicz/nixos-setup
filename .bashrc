#
# ~/.bashrc
# 

 [[ $- != *i* ]] && return

 neofetch
 
 bind -f ~/.inputrc # Loads keybindings

 prompt() {

  local char
  local col=255 # Default color 
 
  case "$PWD" in # $PWD -> Current directory

   /|/boot*) char='';;
   /bin*) char=''; col=46;;
   /root) char='/';;
   /home) char='';;
   /home/nix) char='';;
   /nix*) char=''; col=110;;
   /home/nix/.config) char='';;
   /home/nix/Code) char='';;
   *) char='';; # Default	   

  esac

  PS1="\[\e[38;5;${col}m\]$char \[\e[0m\]\$(pwd) $ \[\e[0m\]" # e.g. ' /home/nix $ ' 
 
  # Set a string with its character, color and directory.
  # \e[38 -> Will be foreground color;5 -> using 256 colors palette.
  # \[\e[0m\] Prevent the character color to propagate for the entire prompt.
 
 }

 PROMPT_COMMAND=prompt # Changes automatically the prompt by the current directory using prompt function
 
 if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then

    startx

 fi

 alias clearn='clear ; neofetch'
 
 # Starts once the script as subprocess for shell session

 if [[ -z "${SCRIPT_RUNNING:-}" ]]; then

  export SCRIPT_RUNNING=1

  ~/.caps_indicator.sh &

 fi

 xrandr --output HDMI-1 --auto --right-of eDP-1

