output "vpc_id" {
    value = aws_vpc.sprints_tf_vpc.id
}

output "pub_subnet1_id" {
    value = aws_subnet.pub_1.id
}

output "priv_subnet1_id" {
    value = aws_subnet.priv_1.id
}
