resource "null_resource" "test" {
  count = 1
  triggers = {
    trigger = timestamp()
  }
}

variable "magic_animals_list" {
  default = ["unicorn", "dragon", "phoenix", "griffin", "thestral", "cat"]
}
