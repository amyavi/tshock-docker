#!/bin/sh
set -xe

export DOTNET_BUNDLE_EXTRACT_BASE_DIR=/tmp/dotnet-bundle
export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=0

cp --force --archive --update /data/plugins/bin/. /opt/tshock/bin
cp --force --archive --update /data/plugins/*.dll /opt/tshock/ServerPlugins

# shellcheck disable=SC2086
/opt/tshock/TShock.Server \
    --stats-optout \
    -savedirectory /tmp/terraria-savedirectory \
    -connperip "$TERRARIA_CONN_PER_IP" -killinactivesocket \
    -autocreate "$TERRARIA_WORLD_SIZE" -difficulty "$TERRARIA_WORLD_DIFFICULTY" \
    -world "$TERRARIA_WORLD_NAME".wld \
    $TERRARIA_EXTRA_PARAMS
