# Small shared network
resource "network" "main" {
  subnet = "172.20.0.0/25"
}

resource "vm" "workstation" {
  config {
    arch = "x86_64"
  }

  image {
    name = "instruqt-kula/sgt-rsync-workstation-1775072433"
  }

  resources {
    cpu    = 2
    memory = 4096
  }

  network {
    id = resource.network.main.meta.id
  }
}

resource "vm" "fileserver" {
  config {
    arch = "x86_64"
  }

  image {
    name = "instruqt-kula/sgt-rsync-fileserver-1775072434"
  }

  resources {
    cpu    = 2
    memory = 4096
  }

  network {
    id = resource.network.main.meta.id
  }
}
