#!/bin/sh

# install build dependencies
sudo apt-get install git mono-mcs mono-gmcs mono-devel autoconf libtool g++ gettext libglib2.0-cil-dev libgtk2.0-cil-dev libglade2.0-cil-dev libgnome2.0-cil-dev libgconf2.0-cil-dev

# add the ssl certs
sudo certmgr -ssl -m https://go.microsoft.com
sudo certmgr -ssl -m https://nugetgallery.blob.core.windows.net
sudo certmgr -ssl -m https://nuget.org
mozroots --import --sync

# create the working folder
mkdir mono
cd mono

# build and install mono
git clone https://github.com/mono/mono.git
cd mono
./autogen.sh --prefix=/usr && make && sudo make install

# build and install mono-addins
git clone https://github.com/mono/mono-addins.git
cd ../mono-addins
./autogen.sh --prefix=/usr && make && sudo make install

# build and install xsp
git clone https://github.com/mono/xsp.git
cd ../xsp
./autogen.sh --prefix=/usr && make && sudo make install

# install monodevelop not needed for my usecase
#git clone https://github.com/mono/monodevelop.git
#cd ../monodevelop
#./configure --prefix=/usr && make && sudo make install
