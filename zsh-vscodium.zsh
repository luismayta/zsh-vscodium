#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines install vscodium for osx or linux.
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>

ZSH_VSCODIUM_PATH="$(dirname "${0}")"


# shellcheck source=/dev/null
source "${ZSH_VSCODIUM_PATH}"/config/main.zsh

# shellcheck source=/dev/null
source "${ZSH_VSCODIUM_PATH}"/core/main.zsh

# shellcheck source=/dev/null
source "${ZSH_VSCODIUM_PATH}"/internal/main.zsh

# shellcheck source=/dev/null
source "${ZSH_VSCODIUM_PATH}"/pkg/main.zsh
