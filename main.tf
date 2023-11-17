provider "kubernetes" {
  config_path = "/root/.kube/config" # Path to your kubeconfig file
}

resource "kubernetes_deployment" "nginx" {
  metadata {
    name = "nginx-deployment"
    labels = {
      app = "nginx"
    }
  }

  spec {
    replicas = var.numreplicas

    selector {
      match_labels = {
        app = "nginx"
      }
    }

    template {
      metadata {
        labels = {
          app = "nginx"
        }
      }

      spec {
        container {
          image = "nginx:1.7.9"
          name  = "nginx"

          port {
            container_port = 80
          }
        }
      }
    }
  }
}
