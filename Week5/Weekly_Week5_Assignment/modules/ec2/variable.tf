variable "ami" {
  default     = "ami-0e35ddab05955cf57"
  type        = string
  description = "AMI of free tier ubuntu virtual machine"
}

variable "instance-type" {
  default     = "t2.micro"
  type        = string
  description = "t2..micro instance type"
}
