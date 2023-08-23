helm repo add kubevela https://kubevela.github.io/charts
helm repo update
helm install --create-namespace -n vela-system kubevela kubevela/vela-core --wait --kubeconfig /etc/rancher/k3s/k3s
.yaml

# VelaUX needs authentication. The default
# username is admin and the password is VelaUX12345. Please must set and remember the new password after the first login.
