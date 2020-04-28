-- https://modules.prosody.im/mod_lib_ldap.html
-- https://modules.prosody.im/mod_auth_ldap2.html
authentication = 'ldap2'

ldap = {
    hostname = 'localhost:389',
    bind_dn = 'cn=admin,dc=meet,dc=example,dc=com',
    bind_password = 'meet12345',
    --use_tls = true,
    user = {
        usernamefield = 'cn',
        basedn = 'dc=meet,dc=example,dc=com',
        filter = '(objectClass=*)',
	-- admin?
        --namefield = 'cn',
    },
}