output "database_output" {
    username = aws_db_instance.database.username
    password = aws_db_instance.database.pass_word
    port = aws_db_instance.database.port
    hostname = aws_db_instance.database.hostname
    database = aws_db_instance.database.name
}
