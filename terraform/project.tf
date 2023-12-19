#Project

resource "scaleway_account_project" "seemyping-xyz" {
  name = "seemyping-xyz-${var.env}"
}

resource "scaleway_account_ssh_key" "main" {
  project_id = local.project_id
  name       = "main"
  public_key = file("${path.module}/.ssh/id_ed25519.pub")
}
