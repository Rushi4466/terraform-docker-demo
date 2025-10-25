terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.20"    # adjust version if needed
    }
  }
  required_version = ">= 1.0.0"
}

provider "docker" {
  # Default connects to local docker socket:
  # On Linux: unix:///var/run/docker.sock (automatic)
  # On Windows (Docker Desktop): npipe:////./pipe/docker_engine (automatic)
  # You can override with "host" if needed, e.g. host = "unix:///var/run/docker.sock"
}

# Pull an image from Docker Hub
resource "docker_image" "nginx_image" {
  name = "nginx:stable"
}

# Create a container from that image
resource "docker_container" "nginx" {
  name  = "tf-nginx-demo"
  image = docker_image.nginx_image.latest
  ports {
    internal = 80
    external = 8080
  }

  # Optional: restart policy
  restart = "unless-stopped"

  # Optional: environment variables
  # env = ["FOO=bar", "BAZ=qux"]

  # Optional: command override (uncomment to use)
  # command = ["nginx", "-g", "daemon off;"]
}
