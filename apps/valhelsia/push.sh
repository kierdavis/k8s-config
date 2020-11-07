#!/usr/bin/env bash
set -euo pipefail

image="kierdavis/valhelsia:latest"
buildah build-using-dockerfile --squash -t "$image" .
podman push "$image"
