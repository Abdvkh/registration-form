--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: users; Type: SCHEMA; Schema: -; Owner: shinasal
--

CREATE SCHEMA users;


ALTER SCHEMA users OWNER TO shinasal;

SET search_path = users, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = true;

--
-- Name: credentials; Type: TABLE; Schema: users; Owner: shinasal; Tablespace: 
--

CREATE TABLE credentials (
    id integer NOT NULL,
    username character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(100) NOT NULL
);


ALTER TABLE users.credentials OWNER TO shinasal;

--
-- Name: credentials_id_seq; Type: SEQUENCE; Schema: users; Owner: shinasal
--

CREATE SEQUENCE credentials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users.credentials_id_seq OWNER TO shinasal;

--
-- Name: credentials_id_seq; Type: SEQUENCE OWNED BY; Schema: users; Owner: shinasal
--

ALTER SEQUENCE credentials_id_seq OWNED BY credentials.id;


--
-- Name: id; Type: DEFAULT; Schema: users; Owner: shinasal
--

ALTER TABLE ONLY credentials ALTER COLUMN id SET DEFAULT nextval('credentials_id_seq'::regclass);


--
-- Data for Name: credentials; Type: TABLE DATA; Schema: users; Owner: shinasal
--

INSERT INTO credentials VALUES (1, 'e-address@bk.ru', 'e-address@bk.ru', 'e7fe698033351144bf8ff6e4ac46ccfe');


--
-- Name: credentials_id_seq; Type: SEQUENCE SET; Schema: users; Owner: shinasal
--

SELECT pg_catalog.setval('credentials_id_seq', 1, true);


--
-- Name: credentials_email_key; Type: CONSTRAINT; Schema: users; Owner: shinasal; Tablespace: 
--

ALTER TABLE ONLY credentials
    ADD CONSTRAINT credentials_email_key UNIQUE (email);


--
-- Name: credentials_pkey; Type: CONSTRAINT; Schema: users; Owner: shinasal; Tablespace: 
--

ALTER TABLE ONLY credentials
    ADD CONSTRAINT credentials_pkey PRIMARY KEY (id);


--
-- Name: credentials_username_key; Type: CONSTRAINT; Schema: users; Owner: shinasal; Tablespace: 
--

ALTER TABLE ONLY credentials
    ADD CONSTRAINT credentials_username_key UNIQUE (username);


--
-- Name: users; Type: ACL; Schema: -; Owner: shinasal
--

REVOKE ALL ON SCHEMA users FROM PUBLIC;
REVOKE ALL ON SCHEMA users FROM shinasal;
GRANT ALL ON SCHEMA users TO shinasal;
GRANT ALL ON SCHEMA users TO shinasal_admin WITH GRANT OPTION;
GRANT ALL ON SCHEMA users TO shinasal_db;


--
-- Name: credentials; Type: ACL; Schema: users; Owner: shinasal
--

REVOKE ALL ON TABLE credentials FROM PUBLIC;
REVOKE ALL ON TABLE credentials FROM shinasal;
GRANT ALL ON TABLE credentials TO shinasal;
GRANT ALL ON TABLE credentials TO shinasal_admin;


--
-- Name: credentials_id_seq; Type: ACL; Schema: users; Owner: shinasal
--

REVOKE ALL ON SEQUENCE credentials_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE credentials_id_seq FROM shinasal;
GRANT ALL ON SEQUENCE credentials_id_seq TO shinasal;
GRANT ALL ON SEQUENCE credentials_id_seq TO shinasal_admin;


--
-- PostgreSQL database dump complete
--

