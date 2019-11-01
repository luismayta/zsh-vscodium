#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines install vscode for osx or linux.
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>
#

LIGHT_GREEN='\033[1;32m'
CLEAR='\033[0m'

function vscode::install {
    echo -e "${CLEAR}${LIGHT_GREEN}Installing Vscode${CLEAR}"
    brew cask install visual-studio-code
}

function vscode::init {
    if [ ! -x "$(command which code)" ]; then
        echo -e "${CLEAR}${LIGHT_GREEN}Installing required vscode packages${CLEAR}"
    fi
}

function vscode::post_install {
    vscode::load
    if [ -x "$(command which code)" ]; then
        echo -e "${CLEAR}${LIGHT_GREEN}Installing required vscode packages${CLEAR}"
        code --install-extension bierner.markdown-preview-github-styles
        code --install-extension christian-kohler.npm-intellisense
        code --install-extension Dart-Code.flutter
        code --install-extension EditorConfig.EditorConfig
        code --install-extension gornivv.vscode-flutter-files
        code --install-extension ms-azuretools.vscode-docker

        code --install-extension ms-python.python
        code --install-extension ms-vscode.Go
        code --install-extension trixnz.vscode-lua
        code --install-extension vscodevim.vim
        code --install-extension Dart-Code.dart-code
        code --install-extension mauve.terraform

        code --install-extension erd0s.terraform-autocomplete

        code --install-extension timonwong.shellcheck
        code --install-extension waderyan.gitblame
        code --install-extension WakaTime.vscode-wakatime
        code --install-extension aeschli.vscode-css-formatter
        code --install-extension mikestead.dotenv
        code --install-extension mgmcdermott.vscode-language-babel
        code --install-extension christian-kohler.path-intellisense
        code --install-extension wix.vscode-import-cost
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
