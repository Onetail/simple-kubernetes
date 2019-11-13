#!/usr/bin/env bash

RED='\033[0;31m'
NC='\033[0m' # No Color

CMD=$1
STAGE=$2

initialize() {
    set KUBECONFIG_SAVED=$KUBECONFIG
    set KUBECONFIG=$KUBECONFIG:config-demo.yml
    echo $KUBECONFIG
}

usage() {
    echo -e "${RED}Usage: $0 [init|revert] [local|sit|uat|prod]${NC}"
    echo -e "${RED}Usage: $0 [create] [table-to-create]${NC}"
    exit 1
}

case "$CMD" in
  init)
    initialize ${STAGE}
    ;;
  *)
    usage
    ;;
esac