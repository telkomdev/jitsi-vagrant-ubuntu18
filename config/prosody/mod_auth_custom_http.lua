-- Prosody IM
-- Copyright (C) 2008-2010 Waqas Hussain
--
-- This project is MIT/X11 licensed. Please see the
-- COPYING file in the source package for more information.
--

local new_sasl = require "util.sasl".new;
local json = require "util.json";
prosody.unlock_globals();
local http = require "socket.http";
prosody.lock_globals();

local options = module:get_option("auth_custom_http");
local post_url = options and options.post_url;
local ltn12 = require "ltn12";
assert(post_url, "No HTTP POST URL provided");

local provider = {};

function provider.test_password(username, password)
	return nil, "Not supported"
end

function provider.get_password(username)
	return nil, "Not supported"
end

function provider.set_password(username, password)
	return nil, "Not supported"
end

function provider.user_exists(username)
	return true;
end

function provider.create_user(username, password)
	return nil, "Not supported"
end

function provider.delete_user(username)
	return nil, "Not supported"
end

function provider.get_sasl_handler()
	local getpass_authentication_profile = {
		plain_test = function(sasl, username, password, realm)
			local response_body = { }
			local postdata = json.encode({ username = username, password = password });
			local result = http.request{
				url = post_url,
				method = "POST",
				headers =
				{
					["Content-Type"] = "application/json",
					["Content-Length"] = postdata:len()
				},
				source = ltn12.source.string(postdata),
				sink = ltn12.sink.table(response_body)
			}
			local dec = json.decode(response_body[1])
			return dec.success == true, true;
		end,
	};
	return new_sasl(module.host, getpass_authentication_profile);
end


module:provides("auth", provider);