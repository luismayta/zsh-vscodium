#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function vscodium::internal::packages::fix {
    sed -i '' 's,https://open-vsx.org/vscode/gallery,https://marketplace.visualstudio.com/_apis/public/gallery,g' "${VSCODIUM_PRODUCT_FILENAME}"
    sed -i '' 's,https://open-vsx.org/vscode/item,https://marketplace.visualstudio.com/items,g' "${VSCODIUM_PRODUCT_FILENAME}"
}

function vscodium::internal::vscodium::install {
    message_info "Installing vscodium"
    if ! type -p brew > /dev/null; then
        message_warning "VSCODIUM_MESSAGE_BREW"
        return
    fi
    brew install --cask vscodium
    message_success "Installed vscodium"
}

function vscodium::internal::config::vim {
    message_info "Configuration vim for vscodium"
    defaults delete -g ApplePressAndHoldEnabled                                           # If necessary, reset global default
    defaults write com.vscodium ApplePressAndHoldEnabled -bool false
    defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false              # For VS Code
    defaults write com.visualstudio.code.oss ApplePressAndHoldEnabled -bool false         # For VS Codium
    defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false      # For VS Code Insider
    defaults write com.microsoft.VSCodeExploration ApplePressAndHoldEnabled -bool false   # For VS Codium Exploration users
    message_success "Configuration vim for vscodium"
}