#!/bin/bash
clear

echo "Have you installed XCode, XQuartz, Homebrew & Node already? If in doubt, go for no and then install those packages."
select yn in "Yes" "No"; do
    case $yn in
        Yes ) make install; break;;
        No ) echo && echo "Please install all of the following items:"
        echo
        echo "[Xcode](https://itunes.apple.com/gb/app/xcode/id497799835?mt=12)"
        echo "[XQuartz](http://xquartz.macosforge.org/landing/)"
        echo "[Node](http://nodejs.org/)"
        echo "[Homebrew](http://brew.sh/)"
        echo
        echo "and then run this installer again"
        echo && exit;;
    esac
done

echo "Welcome, we're going to install some packages that will help build our website front-end"
echo
echo "Now about to install Python using Homebrew"
echo
brew install python;
echo
echo "Now installing other dependencies"
brew install gettext libpng jpeg libtiff giflib cairo pango libspiro czmq fontconfig automake libtool pkg-config glib pango;
echo
echo "Installing more dependencies"
brew -v install fontforge ttfautohint --with-python --with-cairo --with-czmq --with-gif --with-x --with-libspiro --with-pango --enable-pyextension --debug
echo
echo "Setting XQuartz path"
echo
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/opt/X11/lib/pkgconfig
echo
echo "Allow us to install npm packages globally without sudo"
sudo chown -R $USER /usr/local
echo
echo "Install Gulp globally"
npm install -g gulp
echo
echo "Installing the fontcustom Ruby gem"
sudo gem install fontcustom
echo
echo "Installing our NPM dependencies"
npm install;
echo
echo "Installing Bower dependencies"
bower install;
