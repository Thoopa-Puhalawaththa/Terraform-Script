
terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.48.0"
    }
  }
}

provider "google" {
  project = "devops-assignment-374806"
  region  = "asia-south1"
  zone    = "asia-south1-a"
  credentials = "./devops.json"
}