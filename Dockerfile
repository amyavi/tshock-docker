ARG DOTNET_VERSION=6.0
FROM mcr.microsoft.com/dotnet/runtime:${DOTNET_VERSION}-alpine
ARG TSHOCK_URL=https://github.com/Pryaxis/TShock/releases/download/v5.2.0/TShock-5.2-for-Terraria-1.4.4.9-linux-x64-Release.zip
ARG UID=1000
ARG GID=1000

RUN apk add --no-cache gcompat libstdc++ icu

USER "${UID}:${GID}"
WORKDIR /opt/tshock
RUN wget "$TSHOCK_URL" -O tshock.zip \
    && unzip -n tshock.zip && rm tshock.zip \
    && tar -xvf TShock-Beta-linux-x64-Release.tar && rm TShock-Beta-linux-x64-Release.tar
COPY entrypoint.sh /entrypoint.sh

WORKDIR /data
VOLUME /data

EXPOSE 7777
ENV TERRARIA_CONN_PER_IP=3
ENV TERRARIA_WORLD_NAME=world
ENV TERRARIA_WORLD_SIZE=2
ENTRYPOINT ["/entrypoint.sh"]
