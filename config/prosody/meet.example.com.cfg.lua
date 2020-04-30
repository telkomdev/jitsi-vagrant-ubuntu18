admins = { "focus@auth.meet.example.com" }

VirtualHost "meet.example.com"
    authentication = "custom_http"
    auth_custom_http = { post_url = "http://10.0.2.2:8000/auth/login"; }
    -- authentication = "internal_hashed"

    -- authentication using ldap
    -- authentication = "ldap2"
    ssl = {
        key = "/var/lib/prosody/meet.example.com.key";
        certificate = "/var/lib/prosody/meet.example.com.crt";
    }
    modules_enabled = {
        "bosh";
        "pubsub";
    }
    c2s_require_encryption = false

VirtualHost "auth.meet.example.com"
    ssl = {
        key = "/var/lib/prosody/auth.meet.example.com.key";
        certificate = "/var/lib/prosody/auth.meet.example.com.crt";
    }
    -- authentication = "internal_hashed"
    --
    authentication = "custom_http"
    auth_custom_http = { post_url = "http://10.0.2.2:8000/auth/login"; }
    -- authentication using ldap
    -- authentication = "ldap2"

Component "internal-muc.meet.example.com" "muc"
    modules_enabled = {
        "ping";

    }
    storage = "memory"
    muc_room_cache_size = 1000

Component "conference.meet.example.com" "muc"

Component "muc.meet.example.com" "muc"
    storage = "memory"
    modules_enabled = {


    }
    muc_room_locking = false
    muc_room_default_public_jids = true

Component "jitsi-videobridge.meet.example.com"
    component_secret = "meet12345"

Component "focus.meet.example.com"
    component_secret = "meet12345"