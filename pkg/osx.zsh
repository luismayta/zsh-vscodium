#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function vscodium::install {
    message_info "Installing vscodium"
    if ! type -p brew > /dev/null; then
        message_warning "VSCODIUM_MESSAGE_BREW"
        return
    fi
    brew cask install vscodium
    message_success "Installed vscodium"
}

if ! type -p code > /dev/null; then vscodium::install; fi

function vscodium::fix {
    sed -i '' 's,https://open-vsx.org/vscode/gallery,https://marketplace.visualstudio.com/_apis/public/gallery,g' "${VSCODIUM_PRODUCT_FILENAME}"
    sed -i '' 's,https://open-vsx.org/vscode/item,https://marketplace.visualstudio.com/items,g' "${VSCODIUM_PRODUCT_FILENAME}"
}