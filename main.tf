# Configure docker provider
#
# https://www.terraform.io/docs/providers/docker/index.html
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.16"
    }
  }
  required_version = ">= 0.14"
}

#provider "docker" {
#  host    = "npipe:////.//pipe//docker_engine"
#}
provider "docker" {
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
