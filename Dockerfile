FROM alpine:latest as base

ARG PREFIX="/opt/cross"
ARG TARGET=i686-elf
ARG PATH="$PREFIX/bin:$PATH"

ARG BIN_UTILS_VERSION="2.40"
ARG GDB_VERSION="13.2"
ARG GCC_VERSION="13.1.0"
ARG MPFR_VERSION="4.2.0"
ARG MPC_VERSION="1.3.1"
# ARG GRUB_VERSION="2.06"

ARG MAKE_THREADS=8

WORKDIR /root/

RUN apk add build-base make bison flex gmp texinfo isl-dev bash git grub grub-bios xorriso
SHELL ["/bin/bash", "-c"]
COPY ./scripts/* ./
RUN ./build_mpfr.sh
RUN ./build_mpc.sh
RUN ./build_binutils.sh
RUN ./build_gcc.sh

FROM alpine:latest
COPY --from=base /opt/cross /opt/cross
ENV PATH="/opt/cross/bin:$PATH"
