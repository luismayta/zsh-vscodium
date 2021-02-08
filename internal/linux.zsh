#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function vscodium::internal::packages::fix {
    sudo sed -i '' 's,https://open-vsx.org/vscode/gallery,https://marketplace.visualstudio.com/_apis/public/gallery,g' "${VSCODIUM_PRODUCT_FILENAME}"
    sudo sed -i '' 's,https://open-vsx.org/vscode/item,https://marketplace.visualstudio.com/items,g' "${VSCODIUM_PRODUCT_FILENAME}"
}

function vscodium::internal::vscodium::install {
    message_info "Installing vscodium"
    if ! type -p brew > /dev/null; then
        message_warning "VSCODIUM_MESSAGE_BREW"
        return
    fi
    brew install --cask vscodium
    message_success "Installed vscodium"
}
