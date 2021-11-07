terraform {
  required_version = "~> 1.0.0"

  required_providers {
    aws   = ">= 3.40.0"
    vault = ">= 2.20.0"
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.15.0"
    }
  }
}