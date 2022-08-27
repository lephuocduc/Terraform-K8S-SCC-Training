terraform{    
    backend "remote" {
        hostname = "app.terraform.io"
        organization = "DucLe"

        workspaces {
          name ="Terraform-K8S-SCC-Training"
        }
    }
}