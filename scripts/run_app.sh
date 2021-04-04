#!/usr/bin/env bash

# Usage ./scripts/run_app.sh [ port ] [ host ]

set -eo pipefail

PORT=${1:-3838}
HOST=${2:-0.0.0.0}

R -e "shiny::runApp(appDir = \"$(pwd)\", port = $PORT, host = \"$HOST\")"
