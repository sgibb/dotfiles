#!/bin/bash

stow --target ~ stow ## setup stow

for PACKAGE in */; do
    if [ "${PACKAGE}" != "stow/" ]; then
        stow -R ${PACKAGE}
        if [ -x "${PACKAGE}/install.sh" ] ; then
            ${PACKAGE}/install.sh
        fi
    fi
done
