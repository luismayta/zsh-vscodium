#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines install vscode for osx or linux.
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>

vscode_package_name="vscode"
ZSH_VSCODE_PATH_ROOT=$(dirname "$0")
ZSH_VSCODE_PACKAGES=(
        aeschli.vscode-css-formatter
        bierner.markdown-preview-github-styles
        EditorConfig.EditorConfig
        ms-azuretools.vscode-docker
        aaron-bond.better-comments

        # tasks
        Gruntfuggly.todo-tree

        # languages
        ms-python.python
        trixnz.vscode-lua
        Dart-Code.dart-code
        4ops.terraform
        Dart-Code.flutter
        kumar-harsh.graphql-for-vscode
        gornivv.vscode-flutter-files

        # git
        felipecaputo.git-project-manager

        # appareance
        sirtori.indenticator
        coenraads.bracket-pair-colorizer-2
        oderwat.indent-rainbow

        # tools
        hookyqr.beautify
        mikestead.dotenv
        timonwong.shellcheck
        WakaTime.vscode-wakatime
        aeschli.vscode-css-formatter
        mgmcdermott.vscode-language-babel
        formulahendry.auto-rename-tag
        bierner.markdown-preview-github-styles
        Tyriar.sort-lines
        silvenon.mdx
        selbh.keyboard-scroll
        alefragnani.bookmarks
        jebbs.plantuml

        # buffers
        serafeim.goto-previous-buffer
        will-wow.vscode-open-buffers

        # intellisense
        christian-kohler.path-intellisense
        christian-kohler.npm-intellisense
        leizongmin.node-module-intellisense
        jasonnutter.search-node-modules
        # kiteco.kite
        mrmlnc.vscode-scss

        # linters
        ms-vscode.vscode-typescript-tslint-plugin
        dbaeumer.vscode-eslint
        streetsidesoftware.code-spell-checker

        # debug
        msjsdiag.debugger-for-chrome

        # React
        jawandarajbir.react-vscode-extension-pack
        jingkaizhao.vscode-redux-devtools
        xabikos.ReactSnippets

        # Tools
        esbenp.prettier-vscode
        yatki.vscode-surround
        jacobdufault.fuzzy-search
        wehrstedtcoding.file-picker
        unbug.codelf

        # TypeScript
        pmneo.tsimporter
        steoates.autoimport
        dotup.dotup-vscode-interface-generator

        # theme
        vscode-icons-team.vscode-icons
        arcticicestudio.nord-visual-studio-code
        zhuangtongfa.material-theme

        # vim
        vscodevim.vim

        # snippets
        alexisvt.flutter-snippets
        dsznajder.es7-react-js-snippets
        Nash.awesome-flutter-snippets
        xabikos.JavaScriptSnippets
        infeng.vscode-react-typescript

        # refactor
        wix.glean
)


function code::install {
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
    if ! type -p brew > /dev/null; then
        message_warning "it's neccesary brew, add: luismayta/zsh-brew"
        return
    fi
    brew cask install visual-studio-code
    message_success "Installed vscode"
}

function rsync::install {
    message_info "Installing rsync for ${vscode_package_name}"
    if ! type -p brew > /dev/null; then
        message_warning "it's neccesary brew, add: luismayta/zsh-brew"
    fi
    brew install rsync
    message_success "Installed rsync ${vscode_package_name}"
}

if ! type -p rsync > /dev/null; then rsync::install; fi

function vscode::init {
    if ! type -p code > /dev/null; then
        message_warning "Is Neccesary Installing required vscode packages"
    fi
}

function vscode::sync {
    local vscode_path_conf_user
    vscode_path_conf_user="$(vscode::path::factory)"
    rsync -avzh --progress "${ZSH_VSCODE_PATH_ROOT}/conf/" "${vscode_path_conf_user}/"
}

function vscode::post_install {
    vscode::load

    if ! type -p code > /dev/null; then
        message_warning "it's neccesary have vscode"
        return
    fi

    for package in "${ZSH_VSCODE_PACKAGES[@]}"; do
        code::install "${package}"
    done

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
