#!/bin/bash

PACKAGES=(curl wget httpd)

for PKG in ${PACKAGES[@]}; do
	if [[ $(rpm -qa $PKG) != 0 ]]; then
		echo "The Package does not exist on this system."
		sudo yum -y install $PKG
		echo "The missing Packages have been installed successfully."
	else
		echo "The Packages already exist on this system."
	fi
done
