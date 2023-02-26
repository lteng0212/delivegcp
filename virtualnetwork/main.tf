
provider "google" {
  credentials = file(var.gcp_creds)

  project = "mytestproject-337213"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}