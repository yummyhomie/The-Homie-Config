{ config, pkgs, ... }:

{
  programs.dconf.enable = true;

  # Enable virtualization
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        swtpm.enable = true;
        ovmf.enable = true;
        ovmf.packages = [ pkgs.OVMFFull.fd ]; 
      };
    };
  };

  # Install necessary packages
  environment.systemPackages = with pkgs; [
    virt-manager
    virt-viewer
    spice 
    spice-gtk
    spice-protocol
  ];

  # Add your user to the libvirtd group
  users.users.erik = {
    extraGroups = [ "libvirtd" ];
  };

  # Optional: Enable spice USB redirection
  services.spice-vdagentd.enable = true;
}

# What Each Component Does

# libvirtd: Provides the virtualization management daemon
# qemu_kvm: QEMU with KVM acceleration support
# swtpm: Software TPM emulation (useful for modern OSes)
# OVMF: UEFI firmware support for VMs
# virt-viewer: Lightweight VM console viewer
# spice components: Better graphics and USB redirection support
