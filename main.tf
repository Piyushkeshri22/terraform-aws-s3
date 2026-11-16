resource "aws_s3_bucket" "tf-bkt-e2" {
  bucket = "my-tf-bucket-e2"       # Bucket_name

  tags = {
    Name = "my-aws-tf-s3-bkt-e2"    # Bucket tag
  }
}

# Uploading object to S3 bucket

resource "aws_s3_object" "object" {
  bucket = "my-tf-bucket-e2"
  key    = "main.tf"        # object name to display in s3 bucket
  source = "C:/Users/admin/Desktop/tf-s3/main.tf"    # source file path in local machine

  # The filemd5() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  # etag = "${md5(file("path/to/file"))}"
  etag = filemd5("C:/Users/admin/Desktop/tf-s3/main.tf")  # enter source file path 
}