# class profiles::hypervisor
#
#  This profiles installs an hypervisor mostly
#  with default settings.  
#  The base configuration is kvm

class profiles::hypervisor {


  class { '::libvirt':
    defaultnetwork => true,
  }

  libvirt_pool { 'guest_images_pool':
    ensure     => present,
    type       => 'logical',
    active     => true,
    autostart  => true,
    sourcedev  => '/dev/sdb1',
    sourcename => 'guest_images_lvm',
    target     => '/dev/guest_images_lvm',
  }
}
