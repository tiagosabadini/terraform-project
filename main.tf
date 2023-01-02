provider "google" {
  project = "itgolabs-devops-prod"
  region  = "us-central1"
  zone    = "us-central1-c"
  credentials = "${file("serviceaccount.yaml")}"
}

resource "google_folder" "Devops2" {
  display_name = "Devops2"
  parent       = "organizations/80030572804?"
}

resource "google_folder" "RentalCompanies" {
  display_name = "RentalCompanies"
  parent       = google_folder.Devops2.name
}

resource "google_folder" "Localiza" {
  display_name = "Localiza"
  parent       = google_folder.RentalCompanies.name
}

resource "google_folder" "Movida" {
  display_name = "Movida"
  parent       = google_folder.RentalCompanies.name
}

resource "google_project" "itgolabs-localiza-prod" {
  name       = "itgolabs-localiza-prod"
  project_id = "itgolabs-localiza-prod"
  folder_id  = google_folder.Localiza.name
  auto_create_network=false
  billing_account = "01259F-85B956-21408?"
}

resource "google_project" "itgolabs-movida-prod" {
  name       = "itgolabs-movida-prod"
  project_id = "itgolabs-movida-prod"
  folder_id  = google_folder.Movida.name
  auto_create_network=false
  billing_account = "01259F-85B956-21408?"
}
