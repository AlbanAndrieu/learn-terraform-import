
resource "docker_image" "caddy" {
  name = "nabla-servers-symfony-sample_caddy:latest"
}

# docker_container.web:
resource "docker_container" "web" {
  command = [
    "caddy",
    "run",
    "--config",
    "/etc/caddy/Caddyfile",
    "--adapter",
    "caddyfile",
  ]
  cpu_shares = 0
  dns        = []
  dns_opts   = []
  dns_search = []
  entrypoint = []
  group_add  = []
  #hostname          = "8bfed58f299a"
  image      = "docker_image.nabla-servers-symfony-sample_caddy.latest"
  init       = false
  ipc_mode   = "private"
  log_driver = "json-file"
  log_opts = {
    "max-size" = "1000m"
  }
  max_retry_count   = 0
  memory            = 0
  memory_swap       = 0
  name              = "nabla-servers-symfony-sample_caddy_1"
  network_mode      = "nabla-servers-symfony-sample_default"
  privileged        = false
  publish_all_ports = false
  read_only         = false
  restart           = "unless-stopped"
  rm                = false
  security_opts     = []
  shm_size          = 64
  stdin_open        = false
  storage_opts      = {}
  sysctls           = {}
  tmpfs             = {}
  tty               = false
  working_dir       = "/srv/app"

  ports {
    external = 80
    internal = 80
    ip       = "::"
    protocol = "tcp"
  }
  ports {
    external = 80
    internal = 80
    ip       = "::"
    protocol = "tcp"
  }
  ports {
    external = 443
    internal = 443
    ip       = "::"
    protocol = "tcp"
  }
  ports {
    external = 443
    internal = 443
    ip       = "::"
    protocol = "tcp"
  }
  ports {
    external = 443
    internal = 443
    ip       = "::"
    protocol = "udp"
  }
  ports {
    external = 443
    internal = 443
    ip       = "::"
    protocol = "udp"
  }
}
