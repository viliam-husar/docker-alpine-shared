GLIBC_BASE_URL="https://github.com/sgerrand/alpine-pkg-glibc/releases/download" \
&& GLIBC_PACKAGE_VERSION="2.25-r0" \
&& wget \
    "https://raw.githubusercontent.com/andyshinn/alpine-pkg-glibc/master/sgerrand.rsa.pub" \
    -O "/etc/apk/keys/sgerrand.rsa.pub" \
&& wget -P /tmp/glibc_packages \
    "${GLIBC_BASE_URL}/${GLIBC_PACKAGE_VERSION}/glibc-${GLIBC_PACKAGE_VERSION}.apk" \
    "${GLIBC_BASE_URL}/${GLIBC_PACKAGE_VERSION}/glibc-bin-${GLIBC_PACKAGE_VERSION}.apk" \
    "${GLIBC_BASE_URL}/${GLIBC_PACKAGE_VERSION}/glibc-i18n-${GLIBC_PACKAGE_VERSION}.apk" \
&& apk add --no-cache /tmp/glibc_packages/*.apk \
&& /usr/glibc-compat/bin/localedef --force --inputfile POSIX --charmap UTF-8 C.UTF-8 || true \
&& echo "export LANG=C.UTF-8" > /etc/profile.d/locale.sh \
&& apk del glibc-i18n \
&& rm -rf /tmp/glibc_packages /root/.wget-hsts /etc/apk/keys/sgerrand.rsa.pub

ENV LANG=C.UTF-8