# Copyright (C) 2026, Instruqt. All Rights Reserved.

packer {
  required_plugins {
    googlecompute = {
      source  = "github.com/hashicorp/googlecompute"
      version = ">= 1.2.5"
    }
  }
}

variable "project_id" {
  type        = string
  description = "GCP Project ID in which to build images"
}

variable "zone" {
  type        = string
  default     = "europe-west1-b"
  description = "GCP Zone to build in"
}

source "googlecompute" "workstation" {
  project_id              = var.project_id
  source_image_family     = "debian-12"
  source_image_project_id = ["debian-cloud"]
  image_name              = "sgt-rsync-workstation-{{timestamp}}"
  zone                    = var.zone
  image_description       = "Self-guided tour rsync track workstation"
  ssh_username            = "packer"
  tags                    = ["packer"]
  disk_size               = "10"
  image_storage_locations = ["europe-west1"]
}

source "googlecompute" "fileserver" {
  project_id              = var.project_id
  source_image_family     = "debian-12"
  source_image_project_id = ["debian-cloud"]
  image_name              = "sgt-rsync-fileserver-{{timestamp}}"
  zone                    = var.zone
  image_description       = "Self-guided tour rsync track fileserver"
  ssh_username            = "packer"
  tags                    = ["packer"]
  disk_size               = "10"
  image_storage_locations = ["europe-west1"]
}


build {

  source "sources.googlecompute.workstation" {
    name = "workstation"
  }

  source "sources.googlecompute.fileserver" {
    name = "fileserver"
  }

  provisioner "file" {
    source      = "assets/vosp_1000.tgz"
    destination = "/tmp/vosp_1000.tgz"
  }

  provisioner "shell" {
    scripts = [
      "scripts/baseline-software",
      "scripts/users-and-groups",
      "scripts/example-data"
    ]

    env = {
      DESTINATION_HOST = source.name
    }
  }
}

