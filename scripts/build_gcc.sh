# download
cd $HOME
git clone git://gcc.gnu.org/git/gcc.git
cd gcc
git checkout releases/gcc-${GCC_VERSION}

# build / install
cd $HOME
mkdir build-gcc
cd build-gcc
../gcc/configure --target=$TARGET --prefix="$PREFIX" --disable-nls --enable-languages=c,c++ --without-headers
make -j${MAKE_THREADS} all-gcc
make -j${MAKE_THREADS} all-target-libgcc
make install-gcc
make install-target-libgcc