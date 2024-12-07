provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_namespace" "node_app" {
  metadata {
    name = "node-app"
  }
}

resource "kubernetes_deployment" "node_app" {
  metadata {
    name = "node-app"
    namespace = kubernetes_namespace.node_app.metadata[0].name
  }
  spec {
    replicas = 2
    selector {
      match_labels = {
        app = "node-app"
      }
    }
    template {
      metadata {
        labels = {
          app = "node-app"
        }
      }
      spec {
        container {
          image = "node-app:latest"
          name  = "node-app"
          ports {
            container_port = 3000
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "node_app" {
  metadata {
    name = "node-app-service"
    namespace = kubernetes_namespace.node_app.metadata[0].name
  }
  spec {
    selector = {
      app = "node-app"
    }
    port {
      port        = 80
      target_port = 3000
    }
    type = "LoadBalancer"
  }
}
