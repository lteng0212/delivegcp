provider "google" {
  credentials = file(var.gcp_creds)

  project = "mytestproject-337213"
  region  = "us-central1"
  zone    = "us-central1-c"
}

module "vm_compute_instance" {
  source  = "terraform-google-modules/vm/google//modules/compute_instance"
  version = "8.0.0"
  # insert the 1 required variable here
  num_instances     = 2
  zone              = "us-central1-c"
  instance_template = module.instance_template.self_link
}


####################
# Instance Template
####################
module "instance_template" {
  source  = "terraform-google-modules/vm/google//modules/instance_template"
  version = "8.0.0"
  service_account = {
    email  = "175232966468-compute@developer.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }

  machine_type                 = "e2-micro"
  disk_size_gb	               = 50
  disk_type	                   = "pd-standard"
  auto_delete                  = true
  source_image_family          = "centos-7"
  source_image_project         = "centos-cloud"
  additional_disks = [{
    auto_delete  = true
    disk_type    = "pd-ssd"
    disk_size_gb = 5
    boot = false 
    disk_labels = {"test":"test"}
    disk_name = "test"
    device_name = "sdb"
  }]

  subnetwork                   = "terraform-network"
  stack_type                   = "IPV4_ONLY"
  name_prefix                  = "simple"
  alias_ip_range = {
    ip_cidr_range         = "/31"
    subnetwork_range_name = "terraform-network"
  }
}

