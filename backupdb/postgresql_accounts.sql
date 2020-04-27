--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2 (Debian 12.2-2.pgdg100+1)
-- Dumped by pg_dump version 12.2 (Debian 12.2-2.pgdg100+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: prosody; Type: TABLE DATA; Schema: public; Owner: prosody
--

INSERT INTO public.prosody (host, "user", store, key, type, value) VALUES ('auth.meet.example.com', 'focus', 'accounts', 'password', 'string', 'meet12345');
INSERT INTO public.prosody (host, "user", store, key, type, value) VALUES ('auth.meet.example.com', 'jvb', 'accounts', 'password', 'string', 'meet12345');
INSERT INTO public.prosody (host, "user", store, key, type, value) VALUES ('auth.meet.example.com', 'jibri', 'accounts', 'password', 'string', 'meet12345');
INSERT INTO public.prosody (host, "user", store, key, type, value) VALUES ('auth.meet.example.com', 'jigasi', 'accounts', 'password', 'string', 'meet12345');
INSERT INTO public.prosody (host, "user", store, key, type, value) VALUES ('auth.meet.example.com', 'wury', 'accounts', 'password', 'string', '12345');
INSERT INTO public.prosody (host, "user", store, key, type, value) VALUES ('auth.meet.example.com', 'bony', 'accounts', 'password', 'string', '12345');


--
-- PostgreSQL database dump complete
--

