#Project

resource "scaleway_account_project" "seemyping-xyz" {
  name = "seemyping-xyz-${var.env}"
}