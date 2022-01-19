# Dockerfile for divid

FROM ubuntu:20.04
LABEL description="Dockerized divi node"

RUN apt-get update \
  && apt-get install -y curl \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*

ENV HOME /divi
RUN /usr/sbin/useradd -s /bin/bash -m -d /divi divi \
  && chown divi:divi -R /divi

ENV DIVI_VERSION 2.5.1
ENV DIVI_DOWNLOAD_URL https://github.com/DiviProject/Divi/releases/download/v2.5.1/divi-2.5.1-x86_64-linux.tar.gz
RUN cd /tmp \
  && curl -sSL "$DIVI_DOWNLOAD_URL" -o divi.tgz \
  && tar xzf divi.tgz --no-anchored divid divi-cli --transform='s/.*\///' \
  && mv divid divi-cli /usr/bin \
  && rm -rf divi* \
  && echo "#""!/bin/bash\n/usr/bin/divid -datadir=/divi \"\$@\"" > /usr/local/bin/divid \
  && echo "#""!/bin/bash\n/usr/bin/divi-cli -datadir=/divi \"\$@\"" > /usr/local/bin/divi-cli \
  && chmod a+x /usr/local/bin/divid /usr/local/bin/divi-cli /usr/bin/divid /usr/bin/divi-cli

USER divi
VOLUME ["/divi"]
EXPOSE 51472

CMD ["divid"]
