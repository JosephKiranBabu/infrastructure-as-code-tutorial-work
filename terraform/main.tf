resource "google_compute_instance" "raddit" {
  name         = "not-raddit-instance"
  machine_type = "n1-standard-1"
  zone         = "asia-south1-a"

  # boot disk specifications
  boot_disk {
    initialize_params {
      image = "not-raddit-base" // use image built with Packer
    }
  }

  # networks to attach to the VM
  network_interface {
    network = "default"
    access_config {} // use ephemaral public IP
  }
}

