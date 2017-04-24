#!/bin/sh

SCREEPS_PATH=/screeps
SCREEPS_CONFIG=${SCREEPS_PATH}/.screepsrc

# Create Screeps config file if it doesn't exist
if [ ! -e "${SCREEPS_CONFIG}" ]; then
	# Confirm the Steam API key has been passed as an env variable
    if [ -z "$STEAM_KEY" ]; then
        echo "STEAM_KEY must be passed as an environment variable. EXITING PROCESS"
        exit 1
    else
        echo "Initializing the screeps private server"
        echo "${STEAM_KEY}" | screeps init "${SCREEPS_PATH}"
    fi
fi
exec "$@"