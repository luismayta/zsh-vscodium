#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines install vscode for osx or linux.
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>

ZSH_VSCODE_PATH_ROOT=$(dirname "${0}":A)

# shellcheck source=/dev/null
source "${ZSH_VSCODE_PATH_ROOT}"/src/helpers/messages.zsh

# shellcheck source=/dev/null
source "${ZSH_VSCODE_PATH_ROOT}"/src/helpers/tools.zsh

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
        code_install aeschli.vscode-css-formatter
        code_install bierner.markdown-preview-github-styles
        code_install EditorConfig.EditorConfig
        code_install gornivv.vscode-flutter-files
        code_install ms-azuretools.vscode-docker
        code_install wix.vscode-import-cost

        # languages
        message_info "Installing required vscode packages for languages"
        code_install ms-python.python
        code_install ms-vscode.Go
        code_install trixnz.vscode-lua
        code_install Dart-Code.dart-code
        code_install mauve.terraform
        code_install Dart-Code.flutter

        # git
        message_info "Installing required vscode packages for git"
        code_install felipecaputo.git-project-manager

        # tools
        message_info "Installing required vscode packages for tools"
        code_install hookyqr.beautify
        code_install CoenraadS.bracket-pair-colorizer
        code_install mikestead.dotenv
        code_install timonwong.shellcheck
        code_install WakaTime.vscode-wakatime
        code_install aeschli.vscode-css-formatter
        code_install mgmcdermott.vscode-language-babel
        code_install mgmcdermott.vscode-language-babel
        code_install formulahendry.auto-rename-tag
        code_install Gruntfuggly.todo-tree
        code_instal streetsidesoftware.code-spell-checker
        code_install bierner.markdown-preview-github-styles
        code_install dbaeumer.vscode-eslint
        code_install eg2.vscode-npm-script

        # intellisense
        message_info "Installing required vscode packages for intellisense"
        code_install christian-kohler.path-intellisense
        code_install christian-kohler.npm-intellisense
        code_install leizongmin.node-module-intellisense
        code_install jasonnutter.search-node-modules
        code_install erd0s.terraform-autocomplete

        # debug
        message_info "Installing required vscode packages for debug"
        code_install msjsdiag.debugger-for-chrome

        # React
        message_info "Installing required vscode packages for react"
        code_install jawandarajbir.react-vscode-extension-pack
        code_install jingkaizhao.vscode-redux-devtools
        code_install xabikos.ReactSnippets

        # Tools
        message_info "Installing required vscode packages for tool"
        code_install esbenp.prettier-vscode

        # TypeScript
        message_info "Installing required vscode packages for typescript"
        code_install pmneo.tsimporter
        code_install rbbit.typescript-hero

        # theme
        message_info "Installing required vscode packages for Theme"
        code_install vscode-icons-team.vscode-icons

        # vim
        message_info "Installing required vscode packages for vim"
        code_install yatki.vscode-surround
        code_install vscodevim.vim

        # snippets
        message_info "Installing required vscode packages for snippets"
        code_install alexisvt.flutter-snippets
        code_install dsznajder.es7-react-js-snippets
        code_install Nash.awesome-flutter-snippets
        code_install xabikos.JavaScriptSnippets

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
