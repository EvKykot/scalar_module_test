
terraform {
  required_providers {
    datadog = {
      source = "DataDog/datadog"
      version = "3.9.0"
    }
  }
}


#Configure the Datadog provider
provider "datadog" {
  api_key = var.datadog_api_key
  app_key = var.datadog_app_key
}
variable "datadog_api_key" {
default = "01e3861f4019630feaebd43e298876d447f42cd8"
}
variable "datadog_app_key" {
default = "2dbba2f30e17ef01a8dee04583e0a4f9"
}


resource "datadog_logs_custom_pipeline" "sample_pipeline2" {
  filter {
    query = "source:foo"
  }
  name       = "sample pipeline"
  is_enabled = true
  processor {
    grok_parser {
      samples = [<<EOT
hello
world
EOT
] # add some multi-line strings here
      source  = "message"
      grok {
        support_rules = ""
        match_rules   = "Rule %%{word:my_word2} %%{number:my_float2}"
      }
      name       = "sample grok parser"
      is_enabled = true
    }
  }
}

/*
resource "null_resource" "test" {
  count = 1
  triggers = {
    trigger = timestamp()
  }
}

variable "magic_animals_list" {
  default = ["unicorn", "dragon", "phoenix", "griffin", "thestral", "cat"]
}

variable "magic_animals" {
  default = [
    {
      name        = "unicorn"
      power       = "sparkle"
      element     = "light"
      description = "A mystical creature with a single horn on its forehead."
    },
    {
      name        = "dragon"
      power       = "fire"
      element     = "fire"
      description = "A powerful creature with the ability to breathe fire."
    },
    {
      name        = "phoenix"
      power       = "rebirth"
      element     = "fire"
      description = "A legendary bird that is reborn from its own ashes."
    },
    {
      name        = "griffin"
      power       = "majesty"
      element     = "air"
      description = "A majestic creature with the body of a lion and the head of an eagle."
    }
  ]
}
*/
