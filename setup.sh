#!/bin/bash
if [ -z "$NERSC_EASYBUILD_DIR" ]; then
	NERSC_EASYBUILD_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd)"
fi

