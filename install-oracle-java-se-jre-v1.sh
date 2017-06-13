# Dependencies: wget, ca-certificates, unzip
JAVA_VERSION=8
JAVA_UPDATE=131
JAVA_BUILD=11
JAVA_HOME="/opt/java"

wget -nv -P "/tmp/java_packages/" --header "Cookie: oraclelicense=accept-securebackup-cookie;" \
    "http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION}u${JAVA_UPDATE}-b${JAVA_BUILD}/d54c1d3a095b4ff2b6607d096fa80163/jre-${JAVA_VERSION}u${JAVA_UPDATE}-linux-x64.tar.gz"
tar -xzf "/tmp/java_packages/jre-${JAVA_VERSION}u${JAVA_UPDATE}-linux-x64.tar.gz"
mkdir -p /opt
mv "/tmp/java_packages/jre1.${JAVA_VERSION}.0_${JAVA_UPDATE}" "${JAVA_HOME}"
ln -s "$JAVA_HOME/bin/"* "/usr/bin/"
rm -rf \
   "${JAVA_HOME}/lib/plugin.jar" \
   "${JAVA_HOME}/lib/ext/jfxrt.jar" \
   "${JAVA_HOME}/bin/javaws" \
   "${JAVA_HOME}/lib/javaws.jar" \
   "${JAVA_HOME}/lib/desktop" \
   "${JAVA_HOME}/plugin" \
   "${JAVA_HOME}/lib/"deploy* \
   "${JAVA_HOME}/lib/"*javafx* \
   "${JAVA_HOME}/lib/"*jfx* \
   "${JAVA_HOME}/lib/amd64/libdecora_sse.so" \
   "${JAVA_HOME}/lib/amd64/"libprism_*.so \
   "${JAVA_HOME}/lib/amd64/libfxplugins.so" \
   "${JAVA_HOME}/lib/amd64/libglass.so" \
   "${JAVA_HOME}/lib/amd64/libgstreamer-lite.so" \
   "${JAVA_HOME}/lib/amd64/"libjavafx*.so \
   "${JAVA_HOME}/lib/amd64/"libjfx*.so \
   "${JAVA_HOME}/bin/jjs" \
   "${JAVA_HOME}/bin/keytool" \
   "${JAVA_HOME}/bin/orbd" \
   "${JAVA_HOME}/bin/pack200" \
   "${JAVA_HOME}/bin/policytool" \
   "${JAVA_HOME}/bin/rmid" \
   "${JAVA_HOME}/bin/rmiregistry" \
   "${JAVA_HOME}/bin/servertool" \
   "${JAVA_HOME}/bin/tnameserv" \
   "${JAVA_HOME}/bin/unpack200" \
   "${JAVA_HOME}/lib/ext/nashorn.jar" \
   "${JAVA_HOME}/lib/jfr.jar" \
   "${JAVA_HOME}/lib/jfr" \
   "${JAVA_HOME}/lib/oblique-fonts"
echo "export JAVA_HOME=${JAVA_HOME}" > /etc/profile.d/java.sh
rm -rf /tmp/*