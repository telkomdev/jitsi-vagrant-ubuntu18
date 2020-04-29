### Fix Error
 `modulemanager error	Error initializing module 'storage_sql' on 'auth.meet.example.com': /usr/lib/prosody/util/sql.lua:11: module 'DBI' not found`

1. Solution (1)
    <p>If you are using prosody version <b>0.11</b> or higher, currently this version do not support database connectivity. The solution is downgrade to version <b>0.10</b></p>
    ```shell
    $ sudo wget http://archive.ubuntu.com/ubuntu/pool/universe/p/prosody/prosody_0.10.0-1build1_amd64.deb
    $ sudo apt install ./prosody_0.10.0-1build1_amd64.deb
    ```

2. Solution(2) with Prosody `v0.11`
    Make sure `luarocks-5.2` installed follow https://github.com/telkomdev/jitsi-vagrant-ubuntu18/blob/master/ldap.md#install-prosody-ldap-dependencies-v-011 for installation
    ```shell
    $ sudo luarocks-5.2 install luadbi-postgresql POSTGRES_INCDIR=/usr/include/postgresql/
    ```


### Fix Error `SASLError using SCRAM-SHA-1: not-authorized`
    <p>Remove or Comment `VirtualHost "localhost"` inside `.cfg.lua`<p>