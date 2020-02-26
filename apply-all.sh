#!/bin/sh

# If initialising the cluster from scratch, certain elements should be brought up in order.
kubectl apply -f manifests/kube-system/weave.yaml

for file in $(find manifests -name '*.yaml'); do
  echo "[$file]" >&2
  kubectl apply -f $file
done
for file in $(find manifests -name '*.deploy'); do
  echo "[$file]" >&2
  $file up
done
