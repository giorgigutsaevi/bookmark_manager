### To set up the DB
- Connect to `psql` and create the `bookmark_manager` database
	- `CREATE DATABASE bookmark_manager;`
- To set up the appropriate tables, connect to the database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.

### Set up a test database
Every production needs a test environment. To that end, we will set up a test database to use that in our testing environment.
- Connect to `psql` and create the `bookmark_manager_test` database
	- `CREATE DATABASE "bookmark_manager_test";`
- Create bookmarks table for our test DB
	- `CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60));`