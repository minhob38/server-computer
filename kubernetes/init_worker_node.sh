echo "=== kubernetes initailize (worker node) ==="
sudo kubeadm join <control plane node ip>:6443 --token <token> \
--discovery-token-ca-cert-hash sha256:<ca hash>
# join 실패 시, kubeadm reset을 합니다. (이때, /etc/kubernetes를 지우고 하는게 좋습니다.)