resource "null_resource" "test" {
  count = 1
  triggers = {
    trigger = timestamp()
  }
}
