terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.51.0"
    }
  }
}

provider "google" {
  project = var.project_id
  zone    = var.zone
}

variable "project_id" {
  description = "The project ID to host the VM."
  default     = "Project ID"
}

variable "zone" {
  description = "The zone to create the VM in."
  default     = "zone"
}

resource "google_compute_instance" "default" {
  name         = "terraform"
  machine_type = "e2-medium"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    network = "default"
  }
}
