let
  kubeMasterIP = "10.1.1.2";
  kubeMasterHostname = "api.kube";
  kubeMasterAPIServerPort = 6443;
in
{
  getty.autologinUser = "guangtao";
  _imports = [
    (
      { pkgs, ... }:
      {
        # networking.extraHosts = "${kubeMasterIP} ${kubeMasterHostname}";
        networking.firewall.allowedTCPPorts = [ 6443 ];
        environment.systemPackages = with pkgs; [
          pkgs.k3s
          # kompose
          # (pkgs.runCommand "wrap-kubectl" { nativeBuildInputs = [ pkgs.makeWrapper ]; } ''
          #   mkdir -p $out/bin
          #   makeWrapper ${pkgs.kubernetes}/bin/kubectl $out/bin/kubectl \
          #     --set KUBECONFIG "/etc/kubernetes/cluster-admin.kubeconfig"
          # '')
        ];
      }
    )
  ];
  k3s.enable = true;
  k3s.role = "server";
  k3s.extraFlags = toString [
    # "--kubelet-arg=v=4" # Optionally add additional args to k3s
  ];
#   kubernetes = {
#     roles = [
#       "master"
#       "node"
#     ];
#     masterAddress = kubeMasterHostname;
#     apiserverAddress = "http://${kubeMasterHostname}:${
#         toString kubeMasterAPIServerPort
#       }";
#     # easyCerts = true;
#     apiserver = {
#       securePort = kubeMasterAPIServerPort;
#       advertiseAddress = kubeMasterIP;
#     };
#     # use coredns
#     addons.dns.enable = true;
#     # addonManager.enable = true;
#   };
 }
