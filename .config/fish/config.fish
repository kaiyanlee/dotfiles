set fish_greeting

set -x CXX g++
set -x CC gcc
set -x EDITOR vim
set -x GPG_TTY (tty)
set -x GDK_SCALE 2
set -x GDK_DPI_SCALE 0.5

set -x XDG_CURRENT_DESKTOP gnome
set -x QT_QPA_PLATFORMTHEME qt6ct
set -x PYTHONPYCACHEPREFIX ~/.cache

set -x CCACHE_NOCPP2 1
set -x CCACHE_INODECACHE 1
set -x CCACHE_FILECLONE 1
set -x CCACHE_HARDLINK 1

fish_add_path -m ~/.local/bin
fish_add_path -m ~/go/bin

function fish_prompt
    echo (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end

alias youtube-dl "yt-dlp"

cat ~/.cache/wal/sequences

