variable "aws_region" {
    type    = string
    default = "us-west-2"
}

resource "random_pet" "rand_num" {
    length = 5
}

resource "aws_s3_bucket" "bucket" {
    bucket = "my-bucket-test-${random_pet.rand_num.id}"
    force_destroy = true  
    acl = "private"

    tags = {
    Name        = "My bucket"
    }
}

output "bucket_name" {
    value = aws_s3_bucket.bucket.bucket
}

provider "aws" {
    region  = var.aws_region
}

