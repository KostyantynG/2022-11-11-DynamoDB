resource "aws_db_subnet_group" "employees_subnet_group" {
    name = "employees subnet group"
    subnet_ids = ["${aws_subnet.management_a.id}","${aws_subnet.management_b.id}"]
}