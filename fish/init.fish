# Disable fish greeting by seting it to blank
set fish_greeting

# Use Gruvbox Theme
set -gx theme_color_scheme gruvbox

# Set Theme to use Nerd Fonts
set -gx theme_nerd_fonts yes

# Disable Date in right propmt
set -gx theme_display_date no

# Set locale to be english and UTF-8 encoded
set -gx LC_ALL en_US.UTF-8
set -gx LANG en_US.UTF-8

# Set System editor to neovim
set -gx VISUAL nvim
set -gx EDITOR nvim

# Prepend some custom directories to the PATH, for GNU cureutils etc.
set _paths /usr/local/sbin \
					 /usr/local/opt/coreutils/libexec/gnubin \
					 /usr/local/opt/python/libexec/bin \
					 /usr/local/opt/node@10/bin \
					 /Library/TeX/Distributions/TeXLive-2016.texdist/Contents/Programs/texbin

for _path in $_paths
		if contains $_path $PATH
				set -gx PATH (string match -v $_path $PATH)
		end
		set -gxp PATH $_path
end

# Enable GNU coreutils man pages
set -gx MANPATH "/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# Highlight Manpages
set -gx LESS_TERMCAP_mb (printf "\033[01;31m")
set -gx LESS_TERMCAP_md (printf "\033[01;31m")
set -gx LESS_TERMCAP_me (printf "\033[0m")
set -gx LESS_TERMCAP_se (printf "\033[0m")
set -gx LESS_TERMCAP_so (printf "\033[01;44;33m")
set -gx LESS_TERMCAP_ue (printf "\033[0m")
set -gx LESS_TERMCAP_us (printf "\033[01;32m")

function fish_user_key_bindings
	# Vi Mode per Default
	fish_vi_key_bindings

	# Restore Ctrl+f for Autocompletion
 	for mode in insert default visual
 		bind -M $mode \cf forward-char
 	end

	bind -M insert \cK up-or-search
	bind -M insert \cJ down-or-search
end

