#!/bin/sh
for file in $(find manifests -name '*.yaml'); do
  echo "[$file]" >&2
  kubectl apply -f $file
done
for file in $(find manifests -name '*.deploy'); do
  echo "[$file]" >&2
  $file up
done
