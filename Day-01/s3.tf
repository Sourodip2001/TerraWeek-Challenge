resource "aws_s3_bucket" "mybucket" {
  bucket = var.bucketname
  tags = {
    Name = "Mybucket"
    Env  = "dev"
  }
}

