variable "name" {
  description = "Nombre de la VPC"
}
variable "vpc_cidr_block" {
  description = "Ip de la VPC"
}
variable "subnet_cidr_block_pub" {
  description = "IP de la subnet"
  type = list(string)
}
variable "subnet_cidr_block_priv" {
  description = "IP de la subnet"
  type = list(string)
}
variable "azs" {
  description = "zonas de disponibilidad"
  type = list(string)
}