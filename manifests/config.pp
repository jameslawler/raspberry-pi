package { "git":
    ensure => "latest"
}

package { "vim":
    ensure => "latest"
}

# External HDD

package { "ntfs-3g":
    ensure => "latest"
}

file { "/media/HDD":
    ensure => "directory",
    owner  => "root",
    group  => "root",
    mode   => 777,
}

file { '/etc/fstab':
   owner => 'root',
   group => 'root',
   mode => 0644,
   source => "puppet:///modules/fstab/fstab",
}

# SAMBA share

package { "samba":
    ensure => "latest"
}

package { "samba-common-bin":
    ensure => "latest"
}

service { "samba":
    ensure  => "running",
    enable  => "true",
    require => Package["samba","samba-common-bin"],
}

file { '/etc/samba/smb.conf':
   notify => Service["samba"],
   owner => 'root',
   group => 'root',
   mode => 0644,
   source => "puppet:///modules/samba/smb.conf",
}

# MiniDLNA

package { "minidlna":
    ensure => "latest"
}

service { "minidlna":
    ensure  => "running",
    enable  => "true",
    require => Package["minidlna"],
}

file { '/etc/minidlna.conf':
   notify => Service["minidlna"],
   owner => 'root',
   group => 'root',
   mode => 0644,
   source => "puppet:///modules/minidlna/minidlna.conf",
}

# Scripts

file { [ "/home/pi/scripts", "/home/pi/scripts/mount", "/home/pi/scripts/usb", "/home/pi/scripts/miniDLNA" ]:
    ensure => "directory",
}

file { '/home/pi/scripts/mount/readonly.sh':
   owner => 'pi',
   group => 'pi',
   mode => 0755,
   source => "puppet:///modules/scripts/filesystem/readonly.sh",
}

file { '/home/pi/scripts/mount/writeable.sh':
   owner => 'pi',
   group => 'pi',
   mode => 0755,
   source => "puppet:///modules/scripts/filesystem/writeable.sh",
}

file { '/home/pi/scripts/usb/mount.sh':
   owner => 'pi',
   group => 'pi',
   mode => 0755,
   source => "puppet:///modules/scripts/usb/mount.sh",
}

file { '/home/pi/scripts/usb/umount.sh':
   owner => 'pi',
   group => 'pi',
   mode => 0755,
   source => "puppet:///modules/scripts/usb/umount.sh",
}

file { '/home/pi/scripts/miniDLNA/reload.sh':
   owner => 'pi',
   group => 'pi',
   mode => 0755,
   source => "puppet:///modules/scripts/miniDLNA/reload.sh",
}
