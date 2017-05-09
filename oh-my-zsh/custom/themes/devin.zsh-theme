# ZSH Theme emulating the Fish shell's default prompt.

#
# Collapse the PWD to first char of each dirname

_fishy_collapsed_wd() {
  echo $(pwd | perl -pe '
   BEGIN {
      binmode STDIN,  ":encoding(UTF-8)";
      binmode STDOUT, ":encoding(UTF-8)";
   }; s|^$ENV{HOME}|~|g; s|/([^/.])[^/]*(?=/)|/$1|g; s|/\.([^/])[^/]*(?=/)|/.$1|g
')
}


#
# Get return code of last command

local return_status="%{$fg_bold[red]%}%(?..%?)%{$reset_color%}"


#
# Set PWD and GIT info

PROMPT='%{$fg[yellow]%}$(_fishy_collapsed_wd)%{$reset_color%}%(?,%{$fg_bold[green]%},%{$fg_bold[red]%})}%{$reset_color%} '

RPROMPT='%{$fg[yellow]%}$(git_prompt_info)$(git_prompt_status)%{$reset_color%}'



#
# OH My Zsh GIT directives

ZSH_THEME_GIT_PROMPT_PREFIX=" "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg_bold[green]%}+"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg_bold[white]%}!"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg_bold[red]%}-"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg_bold[magenta]%}>"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg_bold[yellow]%}#"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[cyan]%}?"

LS_COLORS='no=00:fi=00:di=33:ln=36:pi=40;35:so=35:bd=40;33;01:cd=40;33;01:ex=32:ow=04;33:*.exe=32:*.tar=31:*.zip=31:*.Z=31:*.gz=31:*.tgz=31:*.jar=31:*.jpg=35:*.gif=35:*.ras=35:*.bmp=35:*.ppm=35:*.xbm=35:*.bm=35:*.xpm=35:*.pm=35:*.png=35:*.mpg=43;34:*.avi=43;34:*.qt=43;34:*.mov=43;34:*.au=42;34:*.wav=42;34:*.ps=37:*.rtf=37:*.txt=37:*.doc=37:*.doc.backup=01;37:*.html=37:*.shtml=37:*.css=37:*.fm=37:*.fm.backup=01;37:*.fm.lck=41;37:*fm.recover*=05;41;37:*.java=37:*.sql=37:*.class=36:*core=41;33:'

#ZSH_THEME_TERM_TAB_TITLE_IDLE="%55<..<%~%<<"
#ZSH_THEME_TERM_TAB_TITLE_IDLE="%~%<<"
#ZSH_THEME_TERM_TAB_TITLE_IDLE="%n@%m:%~"
#ZSH_THEME_TERM_TITLE_IDLE="%n@%m:%~"
ZSH_THEME_TERM_TAB_TITLE_IDLE="%100<..<%n@%m:%~%<<"
ZSH_THEME_TERM_TITLE_IDLE="%100<..<%n@%m:%~%<<"

