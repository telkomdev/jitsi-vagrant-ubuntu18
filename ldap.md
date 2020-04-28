## OPENLDAP

### Install openldap
https://linoxide.com/linux-how-to/install-openldap-phpldapadmin-nginx-server/

### Install `prosody` ldap Dependencies
```shell
$ sudo apt-get install prosody-modules lua-ldap
```

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
