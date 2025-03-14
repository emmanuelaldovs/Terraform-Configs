resource "random_id" "random_id_t" {
  keepers = {
    # Generate a new ID only when a new resource group is defined
    resource_group_name = var.resource_group_name
  }

  byte_length = 8
}

