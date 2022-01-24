#!/bin/bash
if [[ ( "$1" == "apply" || "$1" == "delete" ) && ( "$2" == "prod" || "$2" == "canary" ) ]]; then
    kubectl $1 -f "$2"_nginx-configmap.yaml,"$2"_deployment.yaml,"$2"_service.yaml,"$2"_ingress.yaml
else
    echo "Call deploy.sh [apply|delete] [prod|canary-header|canary-weight]"
fi
