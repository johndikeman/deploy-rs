# SPDX-FileCopyrightText: 2025 Serokell <https://serokell.io/>
#
# SPDX-License-Identifier: MPL-2.0

{
  description = "Deploy two profiles and filter by groups";

  inputs.deploy-rs.url = "github:serokell/deploy-rs";

  outputs = { self, nixpkgs, deploy-rs }: {
    deploy = {
      groups = [ "prod" ];
      nodes.example = {
        hostname = "localhost";
        groups = [ "web" "edge" ];
        profiles = {
          hello = {
            groups = "blue";
            user = "balsoft";
            path = deploy-rs.lib.x86_64-linux.setActivate nixpkgs.legacyPackages.x86_64-linux.hello "./bin/hello";
          };
          cowsay = {
            groups = [ "green" "db" ];
            user = "balsoft";
            path = deploy-rs.lib.x86_64-linux.setActivate nixpkgs.legacyPackages.x86_64-linux.cowsay "./bin/cowsay";
          };
        };
      };
    };

    checks = builtins.mapAttrs (system: deployLib: deployLib.deployChecks self.deploy) deploy-rs.lib;
  };
}
