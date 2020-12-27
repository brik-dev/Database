-- == Lesson 7: User administaration and access rights == --
CREATE USER 'user1'@'localhost' IDENTIFIED WITH mysql_native_password by 'password';
GRANT ALL PRIVILEGES ON geodata._cities TO 'user1'@'localhost';