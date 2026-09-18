# Small shared network
resource "network" "main" {
  subnet = "172.20.0.0/25"
}

resource "vm" "workstation" {
  config {
    arch = "x86_64"
  }

  image {
    name     = "europe-west1-docker.pkg.dev/instruqt-kula/lab-images/sgl-rsync-workstation:1789680867"
    username = "_json_key_base64"
    password = resource.secret.lab_images_reader_b64.value
  }

  resources {
    cpu    = 2
    memory = 4096
  }

  network {
    id = resource.network.main.meta.id
  }

  environment = {
    IGGYS_SSH_PRIVATE_KEY_BASE64 = resource.secret.ssh_key.value
  }
}

resource "vm" "fileserver" {
  config {
    arch = "x86_64"
  }

  image {
    name     = "europe-west1-docker.pkg.dev/instruqt-kula/lab-images/sgl-rsync-fileserver:1789680867"
    username = "_json_key_base64"
    password = resource.secret.lab_images_reader_b64.value
  }

  resources {
    cpu    = 2
    memory = 4096
  }

  network {
    id = resource.network.main.meta.id
  }

  environment = {
    IGGYS_SSH_PRIVATE_KEY_BASE64 = resource.secret.ssh_key.value
  }
}

## resource exec "setup-fileserver" {
##   script = "scripts/setup-fileserver"
##   daemon = false
## 
##   environment = {
##     IGGYS_SSH_PRIVATE_KEY_BASE64 = resource.secret.ssh_key.value
##   }
## }
## 
## resource exec "setup-workstation" {
##   script = "scripts/setup-workstation"
##   daemon = false
## 
##   environment = {
##     IGGYS_SSH_PRIVATE_KEY_BASE64 = resource.secret.ssh_key.value
##   }
## }
