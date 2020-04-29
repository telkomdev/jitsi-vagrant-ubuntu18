## OPENLDAP

### Install `prosody` ldap Dependencies V 0.10
```shell
$ sudo apt-get install prosody-modules lua-ldap
```

### Install `prosody` ldap Dependencies V 0.11
```shell
$ sudo apt-get install liblua5.2-dev
$ sudo wget https://keplerproject.github.io/luarocks/releases/luarocks-2.4.1.tar.gz
$ sudo tar -xzf luarocks-2.4.1.tar.gz
$ sudo ./configure --lua-version=5.2 --versioned-rocks-dir
$ sudo make build
$ sudo make install
$ sudo apt-get install libldap2-dev
$ sudo luarocks-5.2 install lualdap
$ sudo luarocks-5.2 install luacrypto
$ sudo luarocks-5.2 install jwt-jitsi
```

### Install openldap
https://linoxide.com/linux-how-to/install-openldap-phpldapadmin-nginx-server/

### Show `slap` setting
```shell
$ sudo slapcat
```

### Add data from folder `/backupdb/data.ldif` in this repository
```shell
$ ldapadd -x -D cn=admin,dc=meet,dc=example,dc=com -W -f data.ldif
```

### Search data
```shell
$ ldapsearch -x -LLL -b dc=meet,dc=example,dc=com 'cn=andy' cn
```
