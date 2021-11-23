#!/bin/bash
NAMESPACE=$1
echo -e "Pod                                   \t|\tlim.cpu\t|\tlim.mem\t|\treq.cpu\t|\treq.mem"
echo -e "--------------------------------------\t|\t-------\t|\t-------\t|\t-------\t|\t-------"
kubectl get pods -n $NAMESPACE | sed '1d' | awk '{print $1}' | sort | while read POD; do
  kubectl get pod $POD -n $NAMESPACE -o jsonpath='{range .spec.containers[*]}{"'$POD'"}{"\t|\t"}--{.resources.limits.cpu}{"\t|\t"}--{.resources.limits.memory}{"\t|\t"}--{.resources.requests.cpu}{"\t|\t"}--{.resources.requests.memory}{"\n"}{end}' | sed -E -e 's/--([0-9])/\1/g' -e 's/--/-/g'
done
