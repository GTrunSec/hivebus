{
  description = "A very basic flake";

  inputs = {
    # styx.url = "github:styx-static/styx";
    styx.url = "github:styx-static/styx/?ref=refs/pull/78/head";
  };

  outputs = {self, ...}: {};
}
