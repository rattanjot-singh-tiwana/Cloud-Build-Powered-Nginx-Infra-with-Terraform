# Provider Configuration
provider "google" {
  project = "keen-bongo-400523"
  region  = "us-central1"
  zone    = "us-central1-a"
}
# Create a Service Account
resource "google_service_account" "ubuntu-sa" {
  account_id   = "ubuntu-sa"
  display_name = "ubuntu-sa"
}
resource "google_project_iam_member" "storage_object_viewer" {
  project = "keen-bongo-400523"
  role    = "roles/storage.objectViewer"
  member  = "serviceAccount:${google_service_account.ubuntu-sa.email}"
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
  service_account {
    email  = google_service_account.ubuntu-sa.email
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }

   metadata = {
    startup-script = file("startup-script.sh")
  }
}