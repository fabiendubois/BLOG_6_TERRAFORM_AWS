############################
# Sans variabiliser le nom #
############################

# provider "aws" {
#   profile = "default"
#   region  = "eu-west-1"
# }

# resource "aws_s3_bucket" "b" {
#   bucket = "mon-premier-bucket-s3-avec-terraform"
#   acl    = "private"
# }


############################
# En variabilisant le nom  #
############################

provider "aws" {
  profile = "default"
  region  = "eu-west-1"
}

variable "bucket_name" {
  type = string
  description = "Nom du bucket S3"
}

resource "aws_s3_bucket" "b" {
  bucket = var.bucket_name
  acl    = "private"
}


############################
#         Output           #
############################

output "arn_de_mon_bucket" {
  value = aws_s3_bucket.b.arn
}
