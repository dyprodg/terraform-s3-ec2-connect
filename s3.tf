//s3.tf

resource "aws_s3_bucket" "terratest_bucket" {
  bucket = "dennis-terratest-bucket"
  tags = {
    Name = "terratest_bucket"
  }
}

resource "aws_s3_bucket_policy" "terratest_policy" {
  bucket = aws_s3_bucket.terratest_bucket.id
  policy = data.aws_iam_policy_document.terratest_policy.json
}

data "aws_iam_policy_document" "terratest_policy" {
  statement {
    actions = [
        "s3:GetObject",
        "s3:PutObject"
    ]

    resources = [ 
        "${aws_s3_bucket.terratest_bucket.arn}/*"
     ]
    
    principals {
      type = "AWS"
      identifiers = [aws_iam_role.ec2_role.arn]
    }
  }
}

