1. Error running: `sudo prosodyctl --config /etc/prosody/prosody.cfg.lua adduser alex@auth.meet.example.com`
    <p>If you are using prosody version <b>0.11</b> or higher, currently this version do not support database connectivity. The solution is downgrade to version <b>0.10</b></p>
```shell
$ sudo wget http://archive.ubuntu.com/ubuntu/pool/universe/p/prosody/prosody_0.10.0-1build1_amd64.deb
$ sudo apt install ./prosody_0.10.0-1build1_amd64.deb
```

2. With Prosody `v0.11` fixing Error `sudo prosodyctl --config /etc/prosody/prosody.cfg.lua adduser alex@auth.meet.example.com`
```shell
$ sudo luarocks-5.2 install luadbi-postgresql POSTGRES_INCDIR=/usr/include/postgresql/
```

2. Error `SASLError using SCRAM-SHA-1: not-authorized`
    <p>Remove or Comment `VirtualHost "localhost"` inside `.cfg.lua`<p>