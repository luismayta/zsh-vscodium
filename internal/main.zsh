#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function vscodium::internal::main::factory {
    # shellcheck source=/dev/null
    source "${ZSH_VSCODIUM_PATH}"/internal/base.zsh
    case "${OSTYPE}" in
    darwin*)
        # shellcheck source=/dev/null
        source "${ZSH_VSCODIUM_PATH}"/internal/osx.zsh
        ;;
    linux*)
        # shellcheck source=/dev/null
        source "${ZSH_VSCODIUM_PATH}"/internal/linux.zsh
      ;;
    esac
}

vscodium::internal::main::factory

if ! core::exists curl; then core::install curl; fi
if ! core::exists rsync; then core::install rsync; fi
if ! [ -e /Applications/VSCodium.app ]; then vscodium::internal::vscodium::install; fi
