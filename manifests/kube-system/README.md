# Namespace `kube-system`

Cluster infrastructure.

## weave.yaml

Out-of-the-box config for [Weave Net][weave], which provides a pod networking service to the cluster via the CNI interface.

Originally downloaded from `https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')`.


[weave]: https://www.weave.works/docs/net/latest/overview/
