#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function vscodium::internal::extension::install {
    code --install-extension "${1}" --force
}

function vscodium::internal::vscodium::install {
    message_info "Installing ${VSCODIUM_PACKAGE_NAME}"
    message_success "Installed ${VSCODIUM_PACKAGE_NAME}"
}

function vscodium::internal::vscodium::load {
    message_warning "Method not implemented for ${VSCODIUM_PACKAGE_NAME}"
}

function vscodium::internal::curl::install {
    message_info "Installing curl for ${VSCODIUM_PACKAGE_NAME}"
    if ! type -p brew > /dev/null; then
        message_warning "${VSCODIUM_MESSAGE_BREW}"
    fi
    brew install curl
    message_success "Installed curl for ${VSCODIUM_PACKAGE_NAME}"
}

function vscodium::internal::packages::install {
    vscodium::internal::packages::fix
    for package in "${VSCODIUM_PACKAGES[@]}"; do
       vscodium::internal::extension::install "${package}"
    done
}
