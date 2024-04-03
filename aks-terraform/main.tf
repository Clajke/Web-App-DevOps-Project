  terraform {
    required_providers {
      azurerm = {
        source = "hashicorp/azurerm"
        version = "3.92.0"
      }
    }
  }

provider "azurerm" {
  features {}
  client_id       = var.client_id
  client_secret   = var.client_secret
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}

module "networking" {
  source              = "./modules/networking-module"
  resource_group_name = "resource_group_1"
  location            = "Uk South"
  vnet_address_space  = ["10.0.0.0/16"]
}

module "aks_cluster_module" {
  source                      = "./modules/aks-cluster-module"
  aks_cluster_name            = "jordaks"
  cluster_location            = "Uk South"
  dns_prefix                  = "jordserver"
  kubernetes_version          = "1.28.3"
  service_principal_client_id = var.client_id
  service_principal_secret    = var.client_secret

  resource_group_name      = module.networking.resource_group_name
  vnet_id                  = module.networking.vnet_id
  control_plane_subnet_id  = module.networking.control_plane_subnet_id
  worker_node_subnet_id    = module.networking.worker_node_subnet_id
  aks_nsg_id               = module.networking.aks_nsg_id
}

