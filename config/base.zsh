#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

export VSCODE_GALLERY_SERVICE_URL='https://marketplace.visualstudio.com/_apis/public/gallery'
export VSCODE_GALLERY_CACHE_URL='https://vscode.blob.core.windows.net/gallery/index'
export VSCODE_GALLERY_ITEM_URL='https://marketplace.visualstudio.com/items'
export VSCODE_GALLERY_CONTROL_URL=''
export VSCODE_GALLERY_RECOMMENDATIONS_URL=''
export VSCODIUM_PACKAGE_NAME="vscodium"
export VSCODIUM_MESSAGE_BREW="Please install brew or use antibody bundle luismayta/zsh-brew branch:develop"
export VSCODIUM_MESSAGE_NOT_FOUND="this not found installed"
export VSCODIUM_PACKAGES=(
        EditorConfig.EditorConfig
        ms-azuretools.vscode-docker
        aaron-bond.better-comments

        # languages
        ms-python.python
        trixnz.vscode-lua

        kumar-harsh.graphql-for-vscode
        # dart
        luanpotter.dart-import
        Dart-Code.dart-code
        BendixMa.dart-data-class-generator
        oscarcs.dart-syntax-highlighting-only

        # flutter
        Dart-Code.flutter
        gornivv.vscode-flutter-files
        aksharpatel47.vscode-flutter-helper
        esskar.vscode-flutter-i18n-json

        # pub
        everettjf.pubspec-dependency-search

        4ops.terraform

        # appareance
        sirtori.indenticator
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
        alefragnani.bookmarks
        jebbs.plantuml

        # projects
        hadenlabs.ghq-project-manager

        # buffers
        serafeim.goto-previous-buffer
        will-wow.vscode-open-buffers

        # intellisense
        christian-kohler.path-intellisense
        christian-kohler.npm-intellisense
        leizongmin.node-module-intellisense
        jasonnutter.search-node-modules

        mrmlnc.vscode-scss

        # linters
        ms-vscode.vscode-typescript-tslint-plugin
        dbaeumer.vscode-eslint

        # React
        jawandarajbir.react-vscode-extension-pack
        jingkaizhao.vscode-redux-devtools

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
        nutstick.challenger-deep-monokai
        akamud.vscode-theme-onedark

        # vim
        vscodevim.vim

        # snippets
        alexisvt.flutter-snippets
        Nash.awesome-flutter-snippets
        xabikos.JavaScriptSnippets
        infeng.vscode-react-typescript
        xabikos.ReactSnippets

        # refactor
        wix.glean
)
