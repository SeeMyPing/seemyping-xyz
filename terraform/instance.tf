#Instance

#resource "scaleway_instance_volume" "www-data" {
#  size_in_gb = 10
#  type = "b_ssd"
#  name = "www-data"
#
#}
resource "scaleway_instance_ip" "public_ip" {
  project_id = local.project_id

}

resource "scaleway_instance_server" "seemyping-xyz-www" {
  project_id = local.project_id

  type              = var.instance_type
  image             = "4aaeb1d4-2cc9-4973-8c79-5c1abc7a7e06"
  routed_ip_enabled = false
  ip_id             = scaleway_instance_ip.public_ip.id
  security_group_id = scaleway_instance_security_group.www.id
  root_volume {
    delete_on_termination = true
    size_in_gb            = 10
    volume_type           = "l_ssd"
  }
  #additional_volume_ids = [ scaleway_instance_volume.ww-data.id ]
}

output "instance_ip" {
  value       = scaleway_instance_server.seemyping-xyz-www.public_ip
  sensitive   = false
  description = "instance_ip"
  depends_on  = [scaleway_instance_server.seemyping-xyz-www]
}

