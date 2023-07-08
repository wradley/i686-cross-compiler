# download
cd $HOME
wget https://www.mpfr.org/mpfr-current/mpfr-${MPFR_VERSION}.tar.gz
tar -xzvf mpfr-${MPFR_VERSION}.tar.gz

# build & install
mkdir build-mpfr
cd build-mpfr
../mpfr-${MPFR_VERSION}/configure
make -j${MAKE_THREADS}
make install