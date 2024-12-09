# Provider Configuration
provider "google" {
  project = "keen-bongo-400523"
  region  = "us-central1"
  zone    = "us-central1-a"
}
# Compute Engine Instance Resource
resource "google_compute_instance" "ci_cd_instance" {
  name         = "ci-cd-engine"
  machine_type = "f1-micro"

  # Boot Disk Configuration
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  # Network Interface Configuration
  network_interface {
    network = "default"

    # Enable External Access
    access_config {}
  }

   metadata = {
    startup-script = file("startup-script.sh")
  }
}
