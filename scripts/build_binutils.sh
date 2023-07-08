# download bin utils
cd $HOME
wget https://ftp.gnu.org/gnu/binutils/binutils-${BIN_UTILS_VERSION}.tar.gz
tar -xzvf binutils-${BIN_UTILS_VERSION}.tar.gz

# download gdb
wget https://ftp.gnu.org/gnu/gdb/gdb-${GDB_VERSION}.tar.gz
tar -xzvf gdb-${GDB_VERSION}.tar.gz

# build / install bin utils
mkdir build-binutils
cd build-binutils
../binutils-${BIN_UTILS_VERSION}/configure --target=$TARGET --prefix="$PREFIX" --with-sysroot --disable-nls --disable-werror
make -j8
make install

# build / install gdb
../gdb-${GDB_VERSION}/configure --target=$TARGET --prefix="$PREFIX" --disable-werror
make -j${MAKE_THREADS} all-gdb
make install-gdb