
RED='\033[0;31m'
NC='\033[0m' # No Color
GREEN='\033[0;32m'

CMD=$1
FILENAME=$2

initialize() {
    export KUBECONFIG_SAVED=$KUBECONFIG
    export KUBETOKEN=$(kubectl describe secret $(kubectl get secrets | grep default | cut -f1 -d ' ') | grep -E '^token' | cut -f2 -d':' | tr -d ' ')
    export KUBEAPISERVER=$(kubectl config view | grep https | cut -f 2- -d ":" | tr -d " ")
    if [ -z "$KUBECONFIG" ] 
    then
        export KUBECONFIG="config-demo.yml"
    else 
        export KUBECONFIG=$KUBECONFIG:"config-demo.yml"
    fi
    echo "${GREEN}現在kube config = $KUBECONFIG${NC}"
    echo "${GREEN}kube token = ${KUBETOKEN}${NC}"
    echo "${GREEN}kube apiServer = ${KUBEAPISERVER} ${NC}"
}

clear() {
    export KUBECONFIG_SAVED=
    export KUBECONFIG=
    export KUBETOKEN=
    export KUBEAPISERVER=
    echo "${GREEN}現在kube config = $KUBECONFIG ${NC}"
    echo "${GREEN}kube token = ${KUBETOKEN}${NC}"
    echo "${GREEN}kube apiServer = ${KUBEAPISERVER} ${NC}"
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
