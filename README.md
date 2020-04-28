### Jitsi X Prosody X Vagrant

- Vagrant (https://www.vagrantup.com/):

```shell
$ vagrant up
$ vagrant ssh
```

- Install Prosody
https://www.linuxbabe.com/ubuntu/install-configure-prosody-xmpp-server-ubuntu-20-04

    or choose specific prosody version here: http://archive.ubuntu.com/ubuntu/pool/universe/p/prosody/
    ```shell
    $ sudo wget http://archive.ubuntu.com/ubuntu/pool/universe/p/prosody/prosody_0.10.0-1build1_amd64.deb
    $ sudo apt install ./prosody_0.10.0-1build1_amd64.deb
    ```

- Install Nginx
https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-18-04

- Install the rest
https://github.com/jitsi/jitsi-meet/blob/master/doc/manual-install.md

- Install Open LDAP
https://linoxide.com/linux-how-to/install-openldap-phpldapadmin-nginx-server/

- Install PHP fpm for phpldapadmin
https://www.interserver.net/tips/kb/nginx-php-fpm-ubuntu-16-04-18-04/

- Install Postgresql
https://github.com/telkomdev/jitsi-vagrant-ubuntu18/blob/master/install-postgresql.md