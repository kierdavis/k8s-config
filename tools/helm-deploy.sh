#!/bin/sh
set -o errexit -o nounset -o pipefail

# Upgrade a release if it exists, or install it if it doesn't.
# Required environment variables:
#   release_name: name of the release
#   release_namespace: namespace the release resides in
#   chart_repo: URL of the helm chart repository
#   chart_name: name of the helm chart within its repository
#   values: path to yaml file containing configuration values for the release

if [ -z "${release_name:-}" ]; then
  echo >&2 "release_name must be set"
  exit 1
fi
if [ -n "${release_namespace:-}" ]; then 
  ns_option="--namespace=$release_namespace"
else
  ns_option=""
fi
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
  operation=upgrade
else
  # release doesn't already exist
  operation=install
fi

set -x
exec helm $operation $ns_option $values_option --repo="$chart_repo" "$release_name" "$chart_name"
