#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function vscodium::config::main::factory {
    # shellcheck source=/dev/null
    source "${ZSH_VSCODIUM_PATH}"/config/base.zsh
    case "${OSTYPE}" in
    darwin*)
        # shellcheck source=/dev/null
        source "${ZSH_VSCODIUM_PATH}"/config/osx.zsh
        ;;
    linux*)
        # shellcheck source=/dev/null
        source "${ZSH_VSCODIUM_PATH}"/config/linux.zsh
      ;;
    esac
}

vscodium::config::main::factory