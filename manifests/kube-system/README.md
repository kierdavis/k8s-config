# Namespace `kube-system`

Cluster infrastructure.

## Weave Net

[Weave Net][weave] provides a pod networking service to the cluster via the CNI interface.

`weave.yaml` was originally downloaded from `https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')`.


[weave]: https://www.weave.works/docs/net/latest/overview/
