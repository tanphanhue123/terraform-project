output "database_config" {
    value = {
        hostname = aws_db_instance.database.address
        database = aws_db_instance.database.name
    }
}