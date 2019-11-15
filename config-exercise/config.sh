
RED='\033[0;31m'
NC='\033[0m' # No Color
GREEN='\033[0;32m'

CMD=$1
FILENAME=$2

initialize() {
    export KUBECONFIG_SAVED=$KUBECONFIG
    if [ -z "$KUBECONFIG" ] 
    then

        export KUBECONFIG="config-demo.yml"
        echo "${GREEN}現在kube config = $KUBECONFIG${NC}"
    else 
        export KUBECONFIG=$KUBECONFIG:"config-demo.yml"
        echo "${GREEN}現在kube config = $KUBECONFIG${NC}"
    fi
}

clear() {
    export KUBECONFIG_SAVED=
    export KUBECONFIG=
    echo "${GREEN}現在kube config = $KUBECONFIG${NC}"
}

usage() {
    echo -e "${RED}Usage: $0 [init|clear] [local|sit|uat|prod]${NC}"
}

case "$CMD" in
  init)
    initialize ${FILENAME}
    ;;
  clear)
    clear
    ;;
  *)
    usage
    ;;
esac
