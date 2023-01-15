#create GCE
resource "google_compute_instance" "vm-from-terraform" {
  name         = "vm-from-terraform"
  machine_type = "e2-medium"
  zone = "asia-south1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels ={
        my_lable = "value"
      }
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = "default" 
    }
  metadata_startup_script ="echo.hi >/test.txt"
  }


#create data base

# See versions at https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance#database_version
resource "google_sql_database_instance" "mysql-from-terraform" {
  name             = "mysql-from-terraform"
  region           = "asia-south1"
  database_version = "MYSQL_8_0"
  settings {
    tier = "db-f1-micro"
  }

  deletion_protection  = "false"
}

resource "google_sql_database" "database-from-todo" {
  name     = "my-database-from-todo"
  instance = "google_sql_database_instance.mysql-from-terraform.name"
}

resource "google_sql_user" "myuser" {
  name     = "thoopa"
  instance = "google_sql_database_instance.mysql-from-terraform.name"
  password = "1997"
}