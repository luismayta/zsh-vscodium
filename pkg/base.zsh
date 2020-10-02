#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function vscodium::sync {
    rsync -avzh --progress "${ZSH_VSCODIUM_PATH}/conf/" "${VSCODIUM_PATH}/"
}

function vscodium::packages::install {
    for package in "${VSCODIUM_PACKAGES[@]}"; do
        code::install "${package}"
    done
}

function vscodium::post_install {
    if ! type -p code > /dev/null; then
        message_warning "it's neccesary have vscodium"
        return
    fi
    vscodium::packages::install
    vscodium::sync
}
