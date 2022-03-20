#!/bin/sh


if [[ ! -d "emacs" ]]
then
	git clone --depth=1 https://github.com/emacs-mirror/emacs.git
fi
sleep 3
pushd emacs
make clean
sleep 2
echo "Starting the compilation procedure (./autogen.sh && ./configure and make)"
./autogen.sh
sleep 2
./configure --prefix=/usr/local --sysconfdir=/etc --libexecdir=/usr/local/lib --localstatedir=/var --mandir=/usr/local/share/man --with-gameuser=:games  --with-modules --without-libotf --without-m17n-flt --without-gconf --without-gsettings --with-native-compilation --with-pgtk --without-xaw3d --program-transform-name=s/\([ec]tags\)/\1.emacs/ --with-json --with-png -with-jpeg --with-tiff --with-gif
echo "Emacs configured! Starting compilation!"
sleep 10
make -j8 NATIVE_FULL_AOT=1
popd
