{
  inputs,
  cell,
}: {
  flops = cell.lib.mkHomeConfig "flops" "guangtao";

  macbook = cell.lib.mkHomeConfig "macbook" "guangtao";
}
