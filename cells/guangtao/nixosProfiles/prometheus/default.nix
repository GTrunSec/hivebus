{
  inputs,
  cell,
}: {
  desktop = {config, ...}: {
    services.prometheus = {
      enable = true;
      port = 9001;
      scrapeConfigs = [
        # {
        #   job_name = "grafana";
        #   static_configs = [{targets = ["127.0.0.1:2342"];}];
        # }
        {
          job_name = "prometheus";
          static_configs = [{targets = ["127.0.0.1:${toString config.services.prometheus.port}"];}];
        }
      ];
    };
  };
}
