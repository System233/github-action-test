#!/bin/bash
source $(dirname $0)/env.sh
mkdir -p $BIN_DIR
cp -af $LL_KILLER_EXEC $LL_ENTRYPOINT $PREFIX
ln -sf $LL_ENTRYPOINT_ROOT $LL_ENTRYPOINT_BIN
mv $PREFIX/usr/share $PREFIX/share
mkdir -p $PREFIX/usr/share
find $PREFIX/share -xtype l -exec "$SCRIPT_DIR/relink.sh" "{}" \;
find $PREFIX/share/applications -name "*.desktop" -exec "$SCRIPT_DIR/setup-desktop.sh" "{}" \; || true
