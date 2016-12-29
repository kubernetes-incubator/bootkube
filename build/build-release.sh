#!/bin/bash
set -euo pipefail

BOOTKUBE_ROOT=$(git rev-parse --show-toplevel)
# sudo rkt run \
#     --volume bk,kind=host,source=${BOOTKUBE_ROOT} \
#     --mount volume=bk,target=/go/src/github.com/kubernetes-incubator/bootkube \
#     --insecure-options=image docker://golang:1.7.4 --exec /bin/bash -- -c \
#     "cd /go/src/github.com/kubernetes-incubator/bootkube && make release"
docker run \
  --volume ${BOOTKUBE_ROOT}:/go/src/github.com/kubernetes-incubator/bootkube \
  golang:1.7.4 /bin/bash -c "cd /go/src/github.com/kubernetes-incubator/bootkube && make release" 