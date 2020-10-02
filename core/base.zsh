#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function core::rsync::install {
    message_info "Installing rsync for ${VSCODIUM_PACKAGE_NAME}"
    if ! type -p brew > /dev/null; then
        message_warning "${VSCODIUM_MESSAGE_BREW}"
    fi
    brew install rsync
    message_success "Installed rsync ${VSCODIUM_PACKAGE_NAME}"
}

if ! type -p rsync > /dev/null; then core::rsync::install; fi