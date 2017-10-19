# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
fortune -s
alias disarmstation='xrandr --output DP1 --off && setxkbmap es'
alias armstation='xrandr --output DP1 --auto --right-of eDP1 && setxkbmap us'
alias terminatorhere='terminator --working-directory=$(pwd)'

