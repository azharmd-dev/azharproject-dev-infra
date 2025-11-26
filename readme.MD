# <span style="color:green">Three-Tier Architecture — Terraform on AWS 📦</span>

This repository provisions a three-tier AWS infrastructure using Terraform.
The design separates public, private, and data layers to provide scalability, security, and fault tolerance.

## Architecture Overview

The environment is organized into 3 logical tiers this ensures:
* Zero direct access to application services from the internet
* Isolated databases
* Controlled traffic via Load Balancers and NAT Gateways
* Better scaling and observability

## Architecture Diagram

![AWS Three Tier Architecture – Terraform VPC, Public, Private, Database Subnets](./assets/three-tier-architecture.drawio)

### Public Subnet
* Accessible from the internet.
* Hosts:
    * Frontend Application Load Balancer (ALB)
    * ptional VPN or Bastion for admin access
* Routes outbound traffic through an Internet Gateway (IGW)

### Private Subnet
* Internal application services (microservices).
* Only reachable from:
    * Frontend ALB
    * Backend ALB
* No direct inbound internet access.
* Outbound access goes through NAT Gateway.
* Example services:
    * Catalogue
    * User
    * Cart
    * Shipping, etc.
### Database Subnet
* Dedicated isolated subnet for persistence services.
* Typically includes:
    * MongoDB
    * Redis
    * MySQL
    * RabbitMQ / Message broker
* No internet access.
* Only accessible from the aplication layer.

## Resources Provisioned
* This Terraform module creates:

### Networking
* VPC
* Internet Gateway (IGW)
* NAT Gateway (in primary public subnet)
* Elastic IP for NAT

### Subnets
* 2 Public subnets — us-east-1a and us-east-1b
* 2 Private subnets — us-east-1a and us-east-1b
* 2 Database subnets — us-east-1a and us-east-1b

### Routing
* Public Route Table
    * Route → IGW
* Private Route Table
    * Route → NAT Gateway
* Database Route Table
    * Route → NAT Gateway (for patching/updates)
* Route table associations
    * Public → Public Subnets
    * Private → Private Subnets
    * Database → DB Subnets

### Network Peering
* Peering connection between created VPC and default VPC
* Public route table updated to reach default VPC
* Default VPC main route table updated to reach created VPC

## Security Model (Best Practice)
* No inbound traffic to private or DB subnets.
* ALB → Private services via target groups.
* Private services → Database via security groups only.
* Admin access through:
    * VPN
    * Bastion host
* No SSH open to 0.0.0.0/0.