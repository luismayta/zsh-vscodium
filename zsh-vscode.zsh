#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines install vscode for osx or linux.
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>

vscode_package_name="vscode"
ZSH_VSCODE_PATH_ROOT=$(dirname "$0")

function code_install {
    code --install-extension "${1}" --force
}

function vscode::path::linux {
    echo "${HOME}"/.config/Code/User
}

function vscode::path::osx {
    echo "${HOME}"/Library/Application\ Support/Code/User
}

function vscode::path::factory {
    case "${OSTYPE}" in
    darwin*)
        vscode::path::osx
        ;;
    linux*)
        vscode::path::linux
    ;;
    esac
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
    if ! type -p code > /dev/null; then
        message_error "Is Neccesary Installing required vscode packages"
    fi
}

function vscode::sync {
    local vscode_path_conf_user
    vscode_path_conf_user="$(vscode::path::factory)"
    rsync -avzh --progress "${ZSH_VSCODE_PATH_ROOT}/conf/" "${vscode_path_conf_user}/"
}

function vscode::post_install {
    vscode::load

    if type -p code > /dev/null; then
        message_info "Installing required vscode packages"
        code_install aeschli.vscode-css-formatter
        code_install bierner.markdown-preview-github-styles
        code_install EditorConfig.EditorConfig
        code_install gornivv.vscode-flutter-files
        code_install ms-azuretools.vscode-docker
        code_install aaron-bond.better-comments

        # tasks
        code_install Gruntfuggly.todo-tree

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

        # appareance
        code_install sirtori.indenticator
        code_install coenraads.bracket-pair-colorizer-2
        code_install oderwat.indent-rainbow

        # tools
        message_info "Installing required vscode packages for tools"
        code_install hookyqr.beautify
        code_install mikestead.dotenv
        code_install timonwong.shellcheck
        code_install WakaTime.vscode-wakatime
        code_install aeschli.vscode-css-formatter
        code_install mgmcdermott.vscode-language-babel
        code_install formulahendry.auto-rename-tag
        code_install bierner.markdown-preview-github-styles
        code_install eg2.vscode-npm-script
        code_install Tyriar.sort-lines
        code_install silvenon.mdx
        code_install selbh.keyboard-scroll
        code_install alefragnani.bookmarks

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
        code_install mrmlnc.vscode-scs

        # linters
        code_install ms-vscode.vscode-typescript-tslint-plugin
        code_install dbaeumer.vscode-eslint
        code_install streetsidesoftware.code-spell-checker

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
        code_install unbug.codelf

        # TypeScript
        message_info "Installing required vscode packages for typescript"
        code_install pmneo.tsimporter
        code_install steoates.autoimport
        code_install dotup.dotup-vscode-interface-generator

        # theme
        message_info "Installing required vscode packages for Theme"
        code_install vscode-icons-team.vscode-icons
        code_install arcticicestudio.nord-visual-studio-code
        code_install zhuangtongfa.material-theme

        # vim
        message_info "Installing required vscode packages for vim"

        code_install vscodevim.vim

        # snippets
        message_info "Installing required vscode packages for snippets"
        code_install alexisvt.flutter-snippets
        code_install dsznajder.es7-react-js-snippets
        code_install Nash.awesome-flutter-snippets
        code_install xabikos.JavaScriptSnippets
        code_install infeng.vscode-react-typescript

        # refactor
        code_install wix.glean

    fi
}

function vscode::load {
    if type -p code > /dev/null; then
        vscode::init
    fi
}

vscode::load

if ! type -p code > /dev/null; then
    vscode::install
fi
