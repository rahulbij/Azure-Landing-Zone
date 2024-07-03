# Azure-Landing-Zone
Azure Landing Zone with 2 Vms,Load balancer, Azure Bastion, keyvault
An Azure Landing Zone is a well-architected, multi-subscription environment for deploying and operating workloads in Azure. It provides a set of guidelines, best practices, and a reference architecture for setting up your Azure environment.

Here's a short description of an Azure Landing Zone with 2 VMs:

Description
In this Azure Landing Zone, we have set up the foundational infrastructure for deploying applications. The setup includes a virtual network, subnets, and two virtual machines (VMs) for running applications or services. This structure ensures a secure, scalable, and manageable environment.

Components
Resource Group:

A container for managing and organizing related Azure resources.
Example: ResourceGroup1
Virtual Network (VNet):

A logical isolation of the Azure cloud dedicated to your subscription.
Example: VNet1
Subnets:

Segments of the VNet to organize and secure resources.
Example: Subnet1, Subnet2
Network Security Groups (NSGs):

Define security rules to control inbound and outbound traffic to network interfaces, VMs, and subnets.
Example: NSG1
Virtual Machines (VMs):

Compute resources to host applications and services.
Example: VM1 and VM2
Architecture Overview
Resource Group:

ResourceGroup1 contains all the resources (VNet, Subnets, NSGs, VMs).
Virtual Network (VNet1):

A virtual network with an address space like 10.0.0.0/16.
Subnets:

Subnet1 (e.g., 10.0.1.0/24): For VM1.
Subnet2 (e.g., 10.0.2.0/24): For VM2.
Network Security Groups (NSGs):

NSG1 associated with Subnet1 and Subnet2 to control traffic.
Virtual Machines:

VM1: Deployed in Subnet1, running a specific application or service.
VM2: Deployed in Subnet2, running another application or service, or serving as a redundant server.
