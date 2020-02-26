#!/usr/bin/env bash
set -o errexit -o nounset -o pipefail

# Upgrade a release if it exists, or install it if it doesn't.
# Required environment variables:
#   release_name: name of the release
#   release_namespace: namespace the release resides in
#   chart_repo: URL of the helm chart repository
#   chart_name: name of the helm chart within its repository
#   values: path to yaml file containing configuration values for the release

if [ $# -lt 1 ]; then
  echo >&2 "usage: $0 up|down"
  exit 2
fi
operation="$1"

if [ -z "${release_name:-}" ]; then
  echo >&2 "release_name must be set"
  exit 1
fi
if [ -n "${release_namespace:-}" ]; then 
  ns_option="--namespace=$release_namespace"
else
  ns_option=""
fi

if [ "$operation" = "up" ]; then
  if [ -z "${chart_repo:-}" ]; then
    echo >&2 "chart_repo must be set"
    exit 1
  fi
  if [ -z "${chart_name:-}" ]; then
    echo >&2 "chart_name must be set"
    exit 1
  fi
  if [ -n "${values:-}" ]; then
    values_option="--values=$values"
  else
    values_option=""
  fi

  if helm status $ns_option "$release_name" >/dev/null 2>&1; then
    # release already exists
    helm_operation=upgrade
  else
    # release doesn't already exist
    helm_operation=install
  fi

  set -x
  exec helm $helm_operation $ns_option $values_option --repo="$chart_repo" "$release_name" "$chart_name"

elif [ "$operation" = "down" ]; then
  set -x
  exec helm uninstall $ns_option "$release_name"

else
  echo >&2 "invalid operation: $operation"
  exit 2
fi
