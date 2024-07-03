# lb = {

#   lb1 = {

#     PIP_name                  = "PublicIPForLB"
#     location                  = "Singapore"
#     resource_group_name       = "ALZ"
#     allocation_method         = "Static"
#     Lb_name                   = "TestLoadBalancer"
#     NIC1                      = "frontend-nic"
#     NIC2                      = "backend-nic"
#     ip_configuration_frontend = "front_end ip configration"
#     ip_configuration_backend  = "back_end ip configration"

#     probe_name                = "Probe1"
#     lb_rule_name              = "mylbrule1"
#     protocol                  = "Tcp"
#     frontend_ip_configuration = "PublicIPAddress"

#   }
# }