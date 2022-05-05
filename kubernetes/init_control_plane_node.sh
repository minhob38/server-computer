echo "=== kubernetis initailize (control plane node) ==="
# https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/
# https://kubernetes.io/docs/reference/setup-tools/kubeadm/kubeadm-init/
# kube init --control-plane-endpoint [control plane ip] --pod-network-cidr=[container들의 대역]
sudo kubeadm init --token-ttl=0

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

echo "=== kubernetis initailize (container network addon) ==="
# https://projectcalico.docs.tigera.io/getting-started/kubernetes/quickstart
kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml

# kubeadm reset으로 cluster를 reset할 수 있습니다. (이때, /etc/kubernetes를 지우고 하는게 좋습니다.)