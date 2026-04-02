#!/usr/bin/env bash

if [[ -d "${PREFIX}/opt/apktool" ]]; then
    command rm -rf "${PREFIX}/opt/apktool"
fi

if [[ -x "${PREFIX}/bin/apktool" ]]; then
    command rm -f "${PREFIX}/bin/apktool"
fi

command mkdir -p "${PREFIX}/opt/apktool"

command wget \
    'https://raw.githubusercontent.com/iBotPeaches/Apktool/master/scripts/linux/apktool' \
    -O "${PREFIX}/opt/apktool/apktool"

command wget \
    'https://bitbucket.org/iBotPeaches/apktool/downloads/apktool_2.10.0.jar' \
    -O "${PREFIX}/opt/apktool/apktool.jar"

command chmod +x "${PREFIX}/opt/apktool/apktool"
command chmod +x "${PREFIX}/opt/apktool/apktool.jar"

command ln -sf \
    "${PREFIX}/opt/apktool/apktool" \
    "${PREFIX}/bin/apktool"

command sed -i \
    "s|libdir=.*|libdir=\"${PREFIX}/opt/apktool\"|g" \
    "${PREFIX}/opt/apktool/apktool"