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
        code --install-extension bierner.markdown-preview-github-styles
        code --install-extension christian-kohler.npm-intellisense
        code --install-extension EditorConfig.EditorConfig
        code --install-extension gornivv.vscode-flutter-files
        code --install-extension ms-azuretools.vscode-docker

        message_info "Installing required vscode packages for languages"
        # languages
        code --install-extension ms-python.python
        code --install-extension ms-vscode.Go
        code --install-extension trixnz.vscode-lua
        code --install-extension vscodevim.vim
        code --install-extension Dart-Code.dart-code
        code --install-extension mauve.terraform
        code --install-extension Dart-Code.flutter

        message_info "Installing required vscode packages for git"
        # git
        code --install-extension felipecaputo.git-project-manager

        message_info "Installing required vscode packages for tools"
        # tools
        code --install-extension erd0s.terraform-autocomplete
        code --install-extension hookyqr.beautify
        code --install-extension CoenraadS.bracket-pair-colorizer
        code --install-extension christian-kohler.path-intellisense
        code --install-extension mikestead.dotenv
        code --install-extension timonwong.shellcheck
        code --install-extension WakaTime.vscode-wakatime
        code --install-extension aeschli.vscode-css-formatter
        code --install-extension mgmcdermott.vscode-language-babel

        message_info "Installing required vscode packages for intellisense"
        # intellisense
        code --install-extension christian-kohler.path-intellisense

        message_info "Installing required vscode packages for debug"
        # debug
        code --install-extension msjsdiag.debugger-for-chrome
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
