# Dependencies: wget, ca-certificates
# ENV to set in target Dockerfile: LANG=C.UTF-8

GLIBC_BASE_URL="https://github.com/sgerrand/alpine-pkg-glibc/releases/download"
GLIBC_PACKAGE_VERSION="2.27-r0"

wget -nv \
    "https://raw.githubusercontent.com/andyshinn/alpine-pkg-glibc/master/sgerrand.rsa.pub" \
    -O "/etc/apk/keys/sgerrand.rsa.pub"
for GLIBC_PACKAGE in glibc glibc-bin glibc-i18n; do wget -nv -P "/tmp/glibc_packages" "${GLIBC_BASE_URL}/${GLIBC_PACKAGE_VERSION}/${GLIBC_PACKAGE}-${GLIBC_PACKAGE_VERSION}.apk" ; done
apk add --no-cache /tmp/glibc_packages/*.apk
/usr/glibc-compat/bin/localedef --force --inputfile POSIX --charmap UTF-8 C.UTF-8 || true
echo "export LANG=C.UTF-8" > /etc/profile.d/locale.sh
apk del glibc-i18n
rm -rf /tmp/glibc_packages /root/.wget-hsts /etc/apk/keys/sgerrand.rsa.pub