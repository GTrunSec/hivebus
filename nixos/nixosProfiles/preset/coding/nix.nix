_:
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nil
    namaka
  ];
}
