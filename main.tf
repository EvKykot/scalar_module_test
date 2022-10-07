resource "random_pet" "test" {
  keepers = {
    keeper = "${var.user_var}"
  }
}

variable "user_var" {}
