#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines install vscode for osx or linux.
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>
#

plugin_dir=$(dirname "${0}":A)

# shellcheck source=/dev/null
source "${plugin_dir}"/src/helpers/messages.zsh

# shellcheck source=/dev/null
source "${plugin_dir}"/src/helpers/tools.zsh

function code_install {
    code --install-extension "${1}" --force
}

function vscode::install {
    message_info "Installing vscode"
    brew cask install visual-studio-code
    message_success "Installed vscode"
}

function vscode::init {
    if [ ! -x "$(command which code)" ]; then
        message_error "Is Neccesary Installing required vscode packages"
    fi
}

function vscode::post_install {
    vscode::load
    if [ -x "$(command which code)" ]; then
        message_info "Installing required vscode packages"
        code_install bierner.markdown-preview-github-styles
        code_install christian-kohler.npm-intellisense
        code_install EditorConfig.EditorConfig
        code_install gornivv.vscode-flutter-files
        code_install ms-azuretools.vscode-docker

        message_info "Installing required vscode packages for languages"
        # languages
        code_install ms-python.python
        code_install ms-vscode.Go
        code_install trixnz.vscode-lua
        code_install vscodevim.vim
        code_install Dart-Code.dart-code
        code_install mauve.terraform
        code_install Dart-Code.flutter

        message_info "Installing required vscode packages for git"
        # git
        code_install felipecaputo.git-project-manager

        message_info "Installing required vscode packages for tools"
        # tools
        code_install erd0s.terraform-autocomplete
        code_install hookyqr.beautify
        code_install CoenraadS.bracket-pair-colorizer
        code_install christian-kohler.path-intellisense
        code_install mikestead.dotenv
        code_install timonwong.shellcheck
        code_install WakaTime.vscode-wakatime
        code_install aeschli.vscode-css-formatter
        code_install mgmcdermott.vscode-language-babel

        message_info "Installing required vscode packages for intellisense"
        # intellisense
        code_install christian-kohler.path-intellisense

        message_info "Installing required vscode packages for debug"
        # debug
        code_install msjsdiag.debugger-for-chrome
    fi
}

function vscode::load {
    if [ -x "$(command which code)" ]; then
        vscode::init
    fi
}

vscode::load

if [ ! -x "$(command which code)" ]; then
    vscode::install
fi
