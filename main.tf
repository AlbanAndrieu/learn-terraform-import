# Configure docker provider
#
# https://www.terraform.io/docs/providers/docker/index.html
terraform {
  #backend "local" {}
  /*
  backend "consul" {
     address = "10.30.0.66:8500"
     path    = "uat/terraform.tfstate"
     scheme  = "http"
     lock    = true
     gzip    = false
  }
  */
  #backend "consul" {}
  /*
  backend "s3" {
    bucket = "jusmundi-terraform"
    // key    = "vault/uat.tfstate"
    region = "eu-west-3"
  }
  backend "swift" {
    container         = "build-tfstates"
    archive_container = "build-tfstates-archive"
    state_name        = "nomad-consul-uat.tfstate"
    region_name       = "GRA"
  }
  backend "remote" {
    hostname = "app.terraform.io"
    # The name of your Terraform Cloud organization.
    organization = "nabla"

    # The name of the Terraform Cloud workspace to store Terraform state files in.
    workspaces {
      #name = "jusmundi"
      prefix = "vault-"
    }
  }
  */
  #backend "http" {}
  # https://www.terraform.io/language/settings/backends/http
  # https://docs.gitlab.com/ee/user/infrastructure/iac/terraform_state.html#get-started-using-local-development
  #backend "remote" {}

  backend "remote" {
    hostname = "app.terraform.io"
    # The name of your Terraform Cloud organization.
    organization = "nabla"

    # The name of the Terraform Cloud workspace to store Terraform state files in.
    workspaces {
      name = "jusmundi"
      #prefix = "vault-"
    }
  }

  required_version = "~> 1.1.6"

  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.16"
    }
  }
}

provider "docker" {
  #host = "npipe:////.//pipe//docker_engine"
  host = "unix:///var/run/docker.sock"
}

# Pulls the image
#resource "docker_image" "ubuntu" {
#  name = "ubuntu:latest"
#}

# Create a container
#resource "docker_container" "foo" {
#  image = docker_image.ubuntu.latest
#  name  = "foo"
#}
