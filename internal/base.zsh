#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function vscode::internal::extension::install {
    code --install-extension "${1}" --force
}
