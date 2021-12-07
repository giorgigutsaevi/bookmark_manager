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

Taking this exercise into consideration, we might have changed our 3 initial URL's, and because it's a pain and bad practice to keep changing ourt feature tests to the 'original' 3 bookmarks everytime we run rspec, it's a quality-of-life improvement to introduce a test database! 