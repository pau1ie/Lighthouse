# Using this local .sql file
This file contains SQL commands to create and populate a local database. To use it, follow these steps:
1. Install a database management system that works with Postgres. We use pgAdmin4, but you can use whatever you prefer. It just needs to be compatible with Postgres.
2. Load this .sql file into your database management system. This will create the necessary tables and populate them with data.
3. In your .env file, you will need to set the DB_HOST, `DB_USER`, `DB_PASSWORD`, `DB_PORT` and `DB_NAME` variables to match the credentials of your local database. Keep environment set to dev in your .env file as well. That way, Lighthouse knows to use your local database.


You'll be using this local database to test Lighthouse on your machine. The credentials for the live database will not be provided, as whatever you're testing should not be messing with that data until your changes are actually live.