output "database_output" {
    port = aws_db_instance.database.port
    hostname = aws_db_instance.database.address
    database = aws_db_instance.database.name
}
