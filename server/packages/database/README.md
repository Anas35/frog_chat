# Database

An interface wrapped around `mysql_client` for managing queries and database connection.

## Running Tests

Test is perfomed using actual MySql table, that required host computer to have mysql connection enable.

To run all unit test,  
```
dart --define=host=[HOST] --define=port=[PORT] --define=userName=[USERNAME] --define=password=[PASSWORD] test test/ --concurrency=1
```