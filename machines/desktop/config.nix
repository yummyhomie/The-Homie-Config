{
  imports = [ 
    ../../programs/nixos/gaming.nix
  ];

  networking.hostName = "the-homie-machine";

  hardware.amdgpu.initrd.enable = true;
}
