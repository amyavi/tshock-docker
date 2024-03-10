#!/bin/sh
set -xe

export DOTNET_BUNDLE_EXTRACT_BASE_DIR=/tmp/dotnet-bundle
export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=0

/opt/tshock/TShock.Server \
    --stats-optout \
    -savedirectory /tmp/terraria-savedirectory \
    -connperip "$TERRARIA_CONN_PER_IP" -killinactivesocket \
    -autocreate "$TERRARIA_WORLD_SIZE" \
    -world "$TERRARIA_WORLD_NAME".wld
