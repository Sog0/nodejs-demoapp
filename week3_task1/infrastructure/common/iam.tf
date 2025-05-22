resource "aws_iam_role" "ec2_docdb_role" {
  name = "ec2-docdb-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "attach_docdb_policy" {
  role       = aws_iam_role.ec2_docdb_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonDocDBFullAccess"
}

resource "aws_iam_instance_profile" "ec2-docdb-profile" {
  name = "ec2-docdb-profile"
  role = aws_iam_role.ec2_docdb_role.name
}
