FROM node:14-slim



ENV APP_VERSION="6.1.4" \
    APP="platformio-core"

LABEL app.name="${APP}" \
      app.version="${APP_VERSION}" 

ENV PYTHONUNBUFFERED=1
RUN apt update && apt install -y python3-pip

RUN pip3 install -U platformio==${APP_VERSION} && \
    mkdir -p /workspace && \
    mkdir -p /.platformio && \
    chmod a+rwx /.platformio && \
    apt install -y git && apt-get clean autoclean && apt-get autoremove --yes && rm -rf /var/lib/{apt,dpkg,cache,log}/

WORKDIR /workspace
ENTRYPOINT ["platformio"] 