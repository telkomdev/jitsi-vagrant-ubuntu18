package com.telkomdev.demo;

import org.jivesoftware.smack.AbstractXMPPConnection;
import org.jivesoftware.smack.ConnectionConfiguration;
import org.jivesoftware.smack.SmackException;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smack.roster.Roster;
import org.jivesoftware.smack.roster.RosterEntry;
import org.jivesoftware.smack.sasl.SASLErrorException;
import org.jivesoftware.smack.tcp.XMPPTCPConnection;
import org.jivesoftware.smack.tcp.XMPPTCPConnectionConfiguration;
import org.jivesoftware.smackx.iqregister.AccountManager;
import org.jxmpp.jid.parts.Localpart;

import javax.net.ssl.KeyManagerFactory;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocketFactory;
import java.io.IOException;
import java.io.InputStream;
import java.security.*;
import java.security.cert.CertificateException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

/**
 * Hello world!
 */
public class App {
    public static void main(String[] args) throws IOException, KeyStoreException, CertificateException, NoSuchAlgorithmException, UnrecoverableKeyException, KeyManagementException {

        String host = "192.168.33.10";
        String xmppDomain = "auth.meet.example.com";
        XMPPTCPConnectionConfiguration.Builder configBuilder = XMPPTCPConnectionConfiguration.builder();
        configBuilder.setXmppDomain(xmppDomain);
        configBuilder.setHost(host);
        configBuilder.setPort(5222);

        configBuilder.setSendPresence(true);
        configBuilder.setSecurityMode(ConnectionConfiguration.SecurityMode.disabled);
        configBuilder.setCompressionEnabled(true);
        configBuilder.setConnectTimeout(10000);

//        KeyStore ks = KeyStore.getInstance("PKCS12");
//        InputStream keyIn = App.class.getResourceAsStream("/server.p12");
//        ks.load(keyIn, "meet12345".toCharArray());
//
//        // Create a SSLSocketFactory that allows for self signed certs
//        SSLContext ctx = SSLContext.getInstance("TLS");
//        KeyManagerFactory kmf = KeyManagerFactory.getInstance("SunX509");
//
//        kmf.init(ks, "meet12345".toCharArray());
//        ctx.init(kmf.getKeyManagers(), null, null);
//
//        SSLSocketFactory socketFactory = ctx.getSocketFactory();
//        configBuilder.setSocketFactory(socketFactory);

        AbstractXMPPConnection connection = new XMPPTCPConnection(configBuilder.build());
        try {
            System.out.println("open connection");
            connection.connect();
            System.out.println("connected "+connection.isConnected());
            connection.login("dena", "12345");

            // get roster
//            Roster roster = Roster.getInstanceFor(connection);
//            Collection<RosterEntry> entries = roster.getEntries();
//            for (RosterEntry entry : entries) {
//                System.out.println(entry);
//            }

            // example registration
//            AccountManager accountManager = AccountManager.getInstance(connection);
//            Map<String, String> attributes = new HashMap<>();
//            attributes.put("name", "full_name");
//            attributes.put("email", "email");
//            attributes.put("phone", "0822567383");
//            if (accountManager.supportsAccountCreation()) {
//                accountManager.sensitiveOperationOverInsecureConnection(true);
//                accountManager.createAccount(Localpart.from("rudy"), "12345", attributes);
//            }

            //connection.login();
        } catch (SmackException | IOException | XMPPException | InterruptedException e) {
            if (e instanceof SmackException) {
                System.out.println("smack error "+ e.getMessage());
            } else if (e instanceof IOException) {
                System.out.println("io error "+ e.getMessage());
            } else if (e instanceof SASLErrorException) {
                System.out.println("login error "+ e.getMessage());
            } else {
                System.out.println("other "+ e.getMessage());
            }
        }
//        finally {
//            System.out.println("closing connection");
//            connection.disconnect();
//        }
    }
}
