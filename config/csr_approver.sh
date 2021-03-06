#!/bin/bash

CSRS=$(KUBECONFIG=/tmp/cluster/auth/kubeconfig /usr/local/bin/oc get -A csr | grep Pending | awk '{print $1}' | xargs)
if [ ! -z "$CSRS" ]
then
  KUBECONFIG=/tmp/cluster/auth/kubeconfig /usr/local/bin/oc adm certificate approve $CSRS
fi

echo "Approved CSRs: $CSRS" >> /var/log/openshift_csr_approver.log

exit 0
