## Using PostgresQL as a Prosody Storage

Install required dependency:
```shell
$ sudo apt-get install lua-dbi-postgresql
```

### Install PostgresQL

```shell
$ sudo apt-get install postgresql postgresql-contrib
```
When the installation is complete, the PostgreSQL server is running, and a Linux user account called postgres has been created.

### Log in to the postgres account.
```shell
$ sudo --login --user postgres
```

### Start the PostgreSQL interactive terminal.
```shell
$ psql
```

### Create the database `prosody`
```shell
$ postgres=# CREATE DATABASE prosody;
```

### Create the prosody user `prosody`.
```shell
$ postgres=# CREATE USER prosody WITH PASSWORD 'meet12345';
```

### Grant the user access to the `prosody` database.
```shell
$ postgres=# GRANT ALL PRIVILEGES ON DATABASE prosody to prosody;
```

### Exit the PostgreSQL interactive terminal
```shell
$ postgres=# \q
```

### Log out of the postgres account.
```shell
$ exit
```

### Configuration
If you use a different server for your database and the Prosody server, you may allow PostgreSQL to listen on all assigned IP Addresses. To do so, open /etc/postgresql/10/main/postgresql.conf as root in a text editor. As a best practice, ensure that only the Prosody server is able to connect to the PostgreSQL port using a firewall.

### Open `postgresql.conf`
```shell
$ sudo vi /etc/postgresql/10/main/postgresql.conf
```

### Find the following line:
```
#listen_addresses = 'localhost'
```

### Uncomment the line and change `localhost` to `*` :
```
listen_addresses = '*'
```

### Restart PostgreSQL for the change to take effect:
```shell
$ sudo systemctl restart postgresql
```

### Modify the file pg_hba.conf to allow the `prosody` server to communicate with the database.
- If the prosody server and the database are on the same machine:

    - Open /etc/postgresql/10/main/pg_hba.conf as root in a text editor.
    - Find the following line
    ```
    local   all             all                        peer
    ```
    - Change `peer` to `trust`
    ```
    local   all             all                        trust
    ```
- If the prosody server and the database are on different machines:
    - Open /etc/postgresql/10/main/pg_hba.conf as root in a text editor.
    - Add the following line to the end of the file, where {prosody-server-IP} is the IP address of the machine that contains the prosody server
    ```
    host all all {prosody-server-IP}/32 md5
    ```


### Reload PostgreSQL:
```shell
$ sudo systemctl reload postgresql
```

### Verify that you can connect with the user `prosody`.

- If the prosody server and the database are on the same machine, use the following command:
```shell
$ psql --dbname=prosody --username=prosody --password
```

- If the prosody server is on a different machine, log into that machine and use the following command:
```shell
$ psql --host={postgres-server-IP} --dbname=prosody --username=prosody --password
```

### Import Sample data
```shell
$ psql --dbname=prosody --username=prosody < accounts.sql
```