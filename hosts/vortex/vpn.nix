{ ... }:
let dir = "/home/vortex/.vpn/vortex";
in {
  services.openvpn.servers = {
    vortex = {
      config = ''
        dev tun
        persist-tun
        persist-key
        data-ciphers AES-256-GCM:AES-128-GCM:CHACHA20-POLY1305:AES-256-CBC
        data-ciphers-fallback AES-256-CBC
        auth SHA256
        tls-client
        client
        resolv-retry infinite
        remote vpnvortex.ddns.net 1194 udp4
        auth-user-pass ${dir}/credentials
        ca ${dir}/ca.crt
        tls-auth ${dir}/tls.key 1
        remote-cert-tls server
        explicit-exit-notify
      '';
      updateResolvConf = true;
    };
  };
}
