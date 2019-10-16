#!/bin/sh
for file in $(find manifests -name '*.yaml'); do
  echo "[$file]" >&2
  kubectl apply -f $file
done
