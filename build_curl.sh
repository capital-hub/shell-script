# #!/bin/sh

. ./config.sh
# CURL_FILENAME=curl-7.70.0.zip 
# CURL_FILE_PATH=/opt/android/$CURL_FILENAME
# CURL_SRC_DIR=/opt/android/curl-7.70.0

# wget https://curl.haxx.se/download/curl-7.70.0.zip && unzip curl-7.70.0.zip && cd curl-7.70.0 

# mv curl-7.70 /opt/android/

# for arch in "aarch" "aarch64" "i686" "x86_64"
# do
# PREFIX=$WORKDIR/prefix_${arch}

# case $arch in
# 	"aarch")   CLANG=armv7a-linux-androideabi${API}-clang
# 		   CXXLANG=armv7a-linux-androideabi${API}-clang++
# 		   X_ARCH="android-arm";;
# 	"aarch64") CLANG=${arch}-linux-android${API}-clang
# 		   CXXLANG=${arch}-linux-android${API}-clang++
# 		   X_ARCH="android-arm64";;
# 	"i686")    CLANG=${arch}-linux-android${API}-clang
# 		   CXXLANG=${arch}-linux-android${API}-clang++
# 		   X_ARCH="android-x86";;
# 	"x86_64")  CLANG=${arch}-linux-android${API}-clang
# 		   CXXLANG=${arch}-linux-android${API}-clang++
# 		   X_ARCH="android-x86_64";;
# 	*)	   CLANG=${arch}-linux-android${API}-clang
# 		   CXXLANG=${arch}-linux-android${API}-clang++
# 		   X_ARCH="android-${arch}";;
# esac 	

# HOST="$arch-linux-android"
# cd /opt/android/curl-7.70.0
# # rm -rf $CURL_SRC_DIR
# # unzip $CURL_FILE_PATH -C /opt/android
# # cd $CURL_SRC_DIR
# ./configure CC=${CLANG} CXX=${CXXLANG} ${X_ARCH} \
# 	no-asm no-shared --host=$HOST\
# 	--prefix=${PREFIX} \
# 	./configure --host=${HOST} --with-ssl --with-zlib --disable-ftp --disable-gopher --disable-file --disable-imap --disable-ldap --disable-ldaps --disable-pop3 --disable-proxy --disable-rtsp --disable-smtp --disable-telnet --disable-tftp --without-gnutls --without-libidn --without-librtmp --disable-dict --with-openssl=${PREFIX}/prefix_${arch} \

# sed -i 's/CNF_EX_LIBS=-ldl -pthread//g;s/BIN_CFLAGS=-pie $(CNF_CFLAGS) $(CFLAGS)//g' Makefile
# make -j4
# make install

# done
cd /opt/android

 wget https://curl.haxx.se/download/curl-7.70.0.zip && unzip curl-7.70.0.zip && cd curl-7.70.0 
    


	 ./configure --with-openssl --host=arm-linux-androideabi --prefix=/opt/android/prefix_aarch \
    && make -j${NPROC} \
    && make install

	 ./configure --with-openssl --host=aarch64-linux-androideabi --prefix=/opt/android/prefix_aarch64 \
    && make -j${NPROC} \
    && make install

	 ./configure --with-openssl --host=x86-linux-androideabi --prefix=/opt/android/prefix_i686 \
    && make -j${NPROC} \
    && make install

	 ./configure --with-openssl --host=x86_64-linux-androideabi --prefix=/opt/android/prefix_x86_64 \
    && make -j${NPROC} \
    && make install