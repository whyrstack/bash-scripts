#!/bin/bash

PACKAGES=(curl wget httpd)

for PKG in ${PACKAGES[@]}; do
        if [[ -z $(rpm -qa $PKG) ]]; then
                echo "The Package $PKG does not exist on this system."
                sleep 5; sudo yum -y -q install $PKG
                echo "$PKG installed"
        else
                echo "The Packages $PKG already exist on this system."
        fi
done
