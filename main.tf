resource "random_pet" "test" {
  keepers = {
    keeper = "${var.user_var}"
  }
  #count = 2000
}

variable "user_var" {}
