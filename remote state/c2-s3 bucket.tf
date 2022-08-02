resource "aws_s3_bucket" "terraform_bucket" {
  bucket = "aws-eks-terraform-poppy125"
  }

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.terraform_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.terraform_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
  depends_on = [aws_s3_bucket.terraform_bucket]
}

resource "aws_s3_bucket_object" "terraform_folder" {
  bucket = aws_s3_bucket.terraform_bucket.id
  key    = "dev/eks-cluster/terraform.tfstate"
}

resource "aws_s3_bucket_object" "k8s_folder" {
  bucket = aws_s3_bucket.terraform_bucket.id
  key    = "dev/app1k8s/terraform.tfstate"
}