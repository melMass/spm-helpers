#!/usr/local/bin/zsh
#************************************************#
#                UI_Rainbow.sh                   #
#          written by Mel Massadian              #
#                 May 29, 2016                   #
#                                                #
#          CLI Colors wrapper (WIP)              #
#************************************************#

# reference
## ATTRIBUTE ()


## FOREGROUND COLORS (30m)
  # 30m black
  # 31m red"
  # 32m green"
  # 33m yellow"
  # 34m blue"
  # 35m mag"
  # 36m cyan"
  # 37m white"   

## BACKGROUND COLORS (40m)
  # 40m black
  # 41m red"
  # 42m green"
  # 43m yellow"
  # 44m blue"
  # 45m mag"
  # 46m cyan"
  # 47m white" 

# VARS
__RAINBOWPALETTE="1"

_BOLD="\e[1m"
_UNDERSCORE="\e[4m"
_BLINK="\e[5m"
_REVERSE="\e[7m"
_BELL="\a"

_header="\n\033[1m"

function __colortext()
{
  #echo "Inside color text, \$1 is $1 and \$2 is $2"
  echo -e "\e[$__RAINBOWPALETTE;$2m$1\e[0m"
}

# TEXT ATTRIBUTES

bold()      { echo -e "$_BOLD""$1""\e[0m"                  }
blink()      { echo -e "$_BLINK""$1""\e[0m"                }
bell()       { echo -e "$_BELL""$1""\e[0m"                 }
reverse()    { echo -e "$_REVERSE""$1""\e[0m"              }
underscore() { echo -e "$_UNDERSCORE""$1""\e[0m"           }

# FOREGROUND COLOR
black()      { echo $(__colortext "$1" "30")               }
green()      { echo "$(__colortext "$1" "32")"             }
red()        { echo $(__colortext "$1" "31")               }
blue()       { echo $(__colortext "$1" "34")               }
purple()     { echo $(__colortext "$1" "35")               }
yellow()     { echo $(__colortext "$1" "33")               }
cyan()       { echo $(__colortext "$1" "36")               }

# BACKGROUND COLOR
bgreen()     { echo $(__colortext "$1" "42")               }
bred()       { echo $(__colortext "$1" "41")               }
bblue()      { echo $(__colortext "$1" "44")               }
bpurple()    { echo $(__colortext "$1" "45")               }
byellow()    { echo $1;echo $(__colortext "$1" "43")       }
bcyan()      { echo $(__colortext "$1" "46")               }

e_note()     { echo $(yellow "▶︎note:") "$1"               }
e_header()   { echo -e "$_header$1\e[0m";                  }
e_success()  { echo $(green '✔ sucess:') $1;               }
e_error()    { echo $(red '✖ error:') $1;                  }
e_arrow()    { echo $(blue ➜) $1;                          }
e_warning()  { echo $(black "$(yellow '⚓︎ warning:')") $1; }

function showcase(){
  e_header  "My Header                  "
  e_note    "I am a quick note          "
  e_arrow   "Arrows are good :)         "
  e_warning "You must absolutely !      "
  e_success "Everything went well       "
  e_error   "Oops something went wrong. "
  
  a="$(green "My") $(blue "Name") $(red "is") $(yellow "Colors")"
  echo $a

}


# restore
ansi-test()
      {
      for a in 0 1 4 5 7; do
              echo "a=$a " 
              for (( f=0; f<=9; f++ )) ; do
                      for (( b=0; b<=9; b++ )) ; do
                              #echo -ne "f=$f b=$b" 
                              echo -ne "\\033[${a};3${f};4${b}m"
                              echo -ne "\\\\\\\\033[${a};3${f};4${b}m"
                              echo -ne "\\033[0m "
                      done
              echo
              done
              echo
      done
      echo
      }
