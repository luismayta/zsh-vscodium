#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function vscodium::core::main::factory {
    # shellcheck source=/dev/null
    source "${ZSH_VSCODIUM_PATH}"/core/base.zsh

    case "${OSTYPE}" in
    darwin*)
        # shellcheck source=/dev/null
        source "${ZSH_VSCODIUM_PATH}"/core/osx.zsh
        ;;
    linux*)
        # shellcheck source=/dev/null
        source "${ZSH_VSCODIUM_PATH}"/core/linux.zsh
      ;;
    esac
}

vscodium::core::main::factory