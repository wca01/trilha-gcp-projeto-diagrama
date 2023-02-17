provider "google" {
  project = "acorp-devops-iac"
  region  = "us-central1"
  zone    = "us-central1-c"
  credentials = "${file("serviceaccount.yaml")}"
}

#Pasta ACOPR/Comercial
resource "google_folder" "Comercial" {
  display_name = "Comercial"
  parent       = "organizations/ID-da-organização"
}

#Pasta ACORP/Comercial/ERP
resource "google_folder" "ERP" {
  display_name = "ERP"
  parent       = google_folder.Comercial.name
}

#Pasta ACORP/Comercial/ERP/Produção
resource "google_folder" "Produção" {
  display_name = "Produção"
  parent       = google_folder.ERP.name
}

#Pasta ACORP/Comercial/ERP/Desenvolvimento
resource "google_folder" "Desenvolvimento" {
  display_name = "Desenvolvimento"
  parent       = google_folder.ERP.name
}

#Pasta ACORP/Comercial/Mobile
resource "google_folder" "Mobile" {
  display_name = "Mobile"
  parent       = google_folder.Comercial.name
}

#Pasta ACORP/Comercial/Mobile/Produção
resource "google_folder" "Produção" {
  display_name = "Produção"
  parent       = google_folder.Mobile.name
}

#Pasta ACORP/Comercial/Mobile/Desenvolvimento
resource "google_folder" "Desenvolvimento" {
  display_name = "Desenvolvimento"
  parent       = google_folder.Mobile.name
}

#Pasta ACOPR/Financeiro
resource "google_folder" "Comercial" {
  display_name = "Comercial"
  parent       = "organizations/ID-da-organização"
}

#Pasta ACOPR/Financeiro/ERP
resource "google_folder" "ERP" {
  display_name = "ERP"
  parent       = google_folder.Comercial.name
}

#Pasta ACOPR/Financeiro/ERP/Produção
resource "google_folder" "Produção" {
  display_name = "Produção"
  parent       = google_folder.ERP.name
}

#Pasta ACOPR/Financeiro/ERP/Desenvolvimento
resource "google_folder" "Desenvolvimento" {
  display_name = "Desenvolvimento"
  parent       = google_folder.ERP.name
}

#Pasta ACOPR/Financeiro/Mobile
resource "google_folder" "Mobile" {
  display_name = "Mobile"
  parent       = google_folder.Comercial.name
}

#Pasta ACOPR/Financeiro/Mobile/Produção
resource "google_folder" "Produção" {
  display_name = "Produção"
  parent       = google_folder.Mobile.name
}

#Pasta ACOPR/Financeiro/Mobile/Desenvolvimento
resource "google_folder" "Desenvolvimento" {
  display_name = "Desenvolvimento"
  parent       = google_folder.Mobile.name
}

#Criação do projeto - Comercial - Produção
resource "google_project" "acorp-com-prod" {
  name       = "com-prod"
  project_id = "acorp-com-prod"
  folder_id  = google_folder.Produção.name
  auto_create_network=false
  billing_account = "ID-Billing-Account"

}

#Criação do projeto - Comercial - Desenvolvimento
resource "google_project" "acorp-com-dev" {
  name       = "com-dev"
  project_id = "acorp-com-dev"
  folder_id  = google_folder.Desenvolvimento.name
  auto_create_network=false
  billing_account = "ID-Billing-Account"

}

#Criação do projeto - Financeiro - Produção
resource "google_project" "acorp-fin-prod" {
  name       = "fin-prod"
  project_id = "acorp-fin-prod"
  folder_id  = google_folder.Produção.name
  auto_create_network=false
  billing_account = "ID-Billing-Account"

}

#Criação do projeto - Financeiro - Desenvolvimento
resource "google_project" "acorp-fin-dev" {
  name       = "fin-dev"
  project_id = "acorp-fin-dev"
  folder_id  = google_folder.Desenvolvimento.name
  auto_create_network=false
  billing_account = "ID-Billing-Account"

}