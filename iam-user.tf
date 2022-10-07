# configured aws provider with proper credentials
# tuto ( https://www.youtube.com/watch?v=AX5uUX2MGik )
provider "aws" {
  region    = "us-east-1"
  profile   = "ngnit-user"
}

# create an iam user
resource "aws_iam_user" "iam_user" {
  name = "Mj-user2"
}

# give the iam user programatic access
resource "aws_iam_access_key" "iam_access_key" {
  user = aws_iam_user.iam_user.name # here we are refferencing the name of the iam user we created up.
}

# create the inline policy ( we want this user to only put get and delete object in the s3 bucket.)
# if you have problem creating policy, do it from visual editor and copy the JSON code.
data "aws_iam_policy_document" "s3_get_put_detele_policy_document" {
  statement {
    actions = [
        "s3:PutObject",
        "s3:GetObject",
        "s3:DeleteObject"
    ]

    resources = [
        "arn:aws:s3:::b2-test/*",
        "arn:aws:s3:::babilone-bucket-1/*"
    ]
  }
}

# attach the policy to the user
resource "aws_iam_user_policy" "s3_get_put_detele_policy" {
  name    = "s3_get_put_detele_policy" # you can call it any name you want. 
  user    = aws_iam_user.iam_user.name
  policy  = data.aws_iam_policy_document.s3_get_put_detele_policy_document.json
}
# push to my github hahahahahah po