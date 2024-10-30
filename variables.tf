variable "subnet_id" {
  type    = string
  default = "subnet-0724ae0ffebb7af24"
}

variable "ami_id" {
  type    = string
  default = "ami-0dee22c13ea7a9a67"
}

variable "terraform_test_instance_type" {  # Updated variable name
  type    = string
  default = "t2.micro"  # Adjust this value if you want a different instance type
}

variable "availability_zones" {
  type    = string
  default = "ap-south-1a"
}

variable "key" {
  type    = string
  default = "terraform-test-key"  # Updated to match your new instance name
}

variable "add_public_ip_address" {
  type    = bool
  default = true
}

variable "root_volume_size" {
  type    = number
  default = 10
}

variable "swap_volume_size" {
  type    = number
  default = 8
}

variable "swap_volume_devicename" {
  type    = string
  default = "/dev/sdb"
}

variable "hostname" {
  type    = string
  default = "terraform-test"  # Updated for consistency with instance name
}

variable "vpc_id" {
  type    = string
  default = "vpc-0c58406cd0c45d9e0"
}
