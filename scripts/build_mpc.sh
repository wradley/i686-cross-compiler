# download
cd $HOME
wget https://ftp.gnu.org/gnu/mpc/mpc-${MPC_VERSION}.tar.gz
tar -xzvf mpc-${MPC_VERSION}.tar.gz

# build & install
mkdir build-mpc
cd build-mpc
../mpc-${MPC_VERSION}/configure
make -j${MAKE_THREADS}
make install