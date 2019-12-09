#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines install vscode for osx or linux.
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>

vscode_package_name="vscode"
ZSH_VSCODE_PATH_ROOT=$(dirname "${0}":A)
VSCODE_PATH_CODE_USER="${HOME}"/Library/Application\ Support/Code/User

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

function rsync::install {
    message_info "Installing rsync for ${vscode_package_name}"
    if ! type -p brew > /dev/null; then
        message_error "it's neccesary brew, add: luismayta/zsh-brew"
    fi
    brew install rsync
    message_success "Installed rsync ${vscode_package_name}"
}

if ! type -p rsync > /dev/null; then rsync::install; fi

function vscode::init {
    if [ ! -x "$(command which code)" ]; then
        message_error "Is Neccesary Installing required vscode packages"
    fi
}

function vscode::sync {
    rsync -avzh --progress "${ZSH_VSCODE_PATH_ROOT}/conf/" "${VSCODE_PATH_CODE_USER}/"
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
        code_install aaron-bond.better-comments

        # languages
        message_info "Installing required vscode packages for languages"
        code_install ms-python.python
        code_install ms-vscode.Go
        code_install trixnz.vscode-lua
        code_install Dart-Code.dart-code
        code_install mauve.terraform
        code_install Dart-Code.flutter

        code_install kumar-harsh.graphql-for-vscode

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
        code_install streetsidesoftware.code-spell-checker
        code_install bierner.markdown-preview-github-styles
        code_install eg2.vscode-npm-script
        code_install Tyriar.sort-lines
        code_install silvenon.mdx
        code_install selbh.keyboard-scroll
        code_install oderwat.indent-rainbow

        # buffers
        code_install serafeim.goto-previous-buffer
        code_install will-wow.vscode-open-buffers

        # intellisense
        message_info "Installing required vscode packages for intellisense"
        code_install christian-kohler.path-intellisense
        code_install christian-kohler.npm-intellisense
        code_install leizongmin.node-module-intellisense
        code_install jasonnutter.search-node-modules
        code_install erd0s.terraform-autocomplete
        code_install kiteco.kite

        # linters
        code_install ms-vscode.vscode-typescript-tslint-plugin
        code_install dbaeumer.vscode-eslint

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
        code_install yatki.vscode-surround
        code_install jacobdufault.fuzzy-search
        code_install wehrstedtcoding.file-picker

        # TypeScript
        message_info "Installing required vscode packages for typescript"
        code_install pmneo.tsimporter
        code_install rbbit.typescript-hero
        code_install steoates.autoimport
        code_install dotup.dotup-vscode-interface-generator


        # theme
        message_info "Installing required vscode packages for Theme"
        code_install vscode-icons-team.vscode-icons

        # vim
        message_info "Installing required vscode packages for vim"

        code_install vscodevim.vim

        # snippets
        message_info "Installing required vscode packages for snippets"
        code_install alexisvt.flutter-snippets
        code_install dsznajder.es7-react-js-snippets
        code_install Nash.awesome-flutter-snippets
        code_install xabikos.JavaScriptSnippets
        # refactor
        code_install wix.glean

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
