#!/usr/bin/env bash

inp() {
	echo -e "\033[1;37m$1\033[0m"
}

pain() {
	echo -e "\033[31m$1\033[0m"
	exit 1
}

prompt() {
	echo -e "\033[36m$1\033[0m"
}

tools() {
	echo -e "\033[1;34m$1\033[0m"
}


# TODO: Manual to avoid wrong versions. Will switch to automatic version later.
inp "Enter the appimage URL, must not be the repo, only the appimage link: "
read URL

install_dir="$HOME/.TOOLS/pdf4qt"

if [[ -d $install_dir ]]; then
 	pain "Already installation directory is filled \nPlease remove the directory $install_dir and try again" 
else 
	prompt "Installing it to $install_dir"
	cd /tmp
	whatdoiname=pdf4qt.appimage
	if [[ -f pdf4qt.appimage ]]; then
		prompt "Skipping download, file found in /tmp"
	else 
		wget -O $whatdoiname $URL || curl -o $URL $whatdoiname 
		prompt "Download Finished"
	fi
	prompt "Extracting"
	if [[ ! -x $whatdoiname ]]; then
		inp "Looks like download appimage is not executable. Would you like to give perms?"
		inp "It will run the command chmod u+x $whatdoiname that is give user executable permission to the file"
		read -p "Choice [y/N]: " chc
		if [[ $chc == "y" ]]; then 
			chmod u+x $whatdoiname
		else 
			pain "Permissions not granted. Exit"
		fi
	fi 
	
	## TODO: Better error handling. Verify with --appimage-help if the file is extractable or not.
	
	./$whatdoiname --appimage-extract
	
	mkdir -p $install_dir
	mv squashfs-root $install_dir
fi

printf "\n\n\n"

inp "============================================="
prompt "Your time to shine!"
prompt "Add this to your PATH variable: "
printf "\n"
prompt "$install_dir/squashfs-root/usr/bin"
printf "\n"
prompt "To your .bashrc or logical equivalent"
printf "\n"
prompt "Available tools you get to use are: "
tools "$(find $install_dir/squashfs-root/usr/bin -executable -type f -printf "%f\n")"
inp "============================================="
 	