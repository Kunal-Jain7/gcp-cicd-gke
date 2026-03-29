resource "kubernetes_deployment_v1" "nginxapp" {
  metadata {
    name = "${var.environment}-nginxapp-deploy"
    labels = {
      app = "nginxapp"
    }
  }
  spec {
    replicas = 2
    selector {
      match_labels = {
        app = "nginxapp"
      }
    }
    template {
      metadata {
        labels = {
          app = "nginxapp"
        }
      }
      spec {
        container {
          image = "ghcr.io/stacksimplify/kubenginx:1.0.0"
          name  = "${var.environment}-nginxapp-deploy"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}

resource "kubernetes_service_v1" "nginx_lb_svc" {
  metadata {
    name = "${var.environment}-nginx-lb-svc"
  }
  spec {
    selector = {
      app = kubernetes_deployment_v1.nginxapp.spec.0.selector.0.match_labels.app
    }
    port {
      port        = 80
      target_port = 80
    }
    type = "LoadBalancer"
  }
}
