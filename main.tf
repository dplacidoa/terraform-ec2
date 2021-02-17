provider "aws" {
  access_key = "AKIASYUWA4NO35KEOD3G"
  secret_key = "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"
  region     = var.name_region
}
resource "aws_instance" "jboss" {
  ami               = var.ami_type
  instance_type     = var.instance_type
  key_name          = var.key_pair
  availability_zone = var.availability_zone
  tags = {
    "Name"        = "Liferay" #Change for the project, ex: Jboss-Standalone...
    "Environment" = "DEV"     #Change for the environment, ex: DEV...
  }
}
resource "aws_ebs_volume" "ebs-jboss" {
  availability_zone = var.availability_zone
  size              = 40
}
resource "aws_volume_attachment" "ebs_attach" {
  device_name = "/dev/sdb"
  volume_id   = aws_ebs_volume.ebs-jboss.id
  instance_id = aws_instance.jboss.id
}