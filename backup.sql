--
-- PostgreSQL database dump
--

\restrict Q8tl3KDf7eJffp8KSxk9XG1uOQx3d06p9BXE4PtXvdKSv5eIPUc8Z4VInkU77NO

-- Dumped from database version 16.11 (Ubuntu 16.11-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.11 (Ubuntu 16.11-0ubuntu0.24.04.1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admin_users; Type: TABLE; Schema: public; Owner: kib
--

CREATE TABLE public.admin_users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp(6) without time zone,
    remember_created_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.admin_users OWNER TO kib;

--
-- Name: admin_users_id_seq; Type: SEQUENCE; Schema: public; Owner: kib
--

CREATE SEQUENCE public.admin_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_users_id_seq OWNER TO kib;

--
-- Name: admin_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kib
--

ALTER SEQUENCE public.admin_users_id_seq OWNED BY public.admin_users.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: kib
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO kib;

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: kib
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO kib;

--
-- Name: visits; Type: TABLE; Schema: public; Owner: kib
--

CREATE TABLE public.visits (
    id bigint NOT NULL,
    name character varying,
    phone character varying,
    keluhan text,
    visit_date date,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.visits OWNER TO kib;

--
-- Name: visits_id_seq; Type: SEQUENCE; Schema: public; Owner: kib
--

CREATE SEQUENCE public.visits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.visits_id_seq OWNER TO kib;

--
-- Name: visits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kib
--

ALTER SEQUENCE public.visits_id_seq OWNED BY public.visits.id;


--
-- Name: admin_users id; Type: DEFAULT; Schema: public; Owner: kib
--

ALTER TABLE ONLY public.admin_users ALTER COLUMN id SET DEFAULT nextval('public.admin_users_id_seq'::regclass);


--
-- Name: visits id; Type: DEFAULT; Schema: public; Owner: kib
--

ALTER TABLE ONLY public.visits ALTER COLUMN id SET DEFAULT nextval('public.visits_id_seq'::regclass);


--
-- Data for Name: admin_users; Type: TABLE DATA; Schema: public; Owner: kib
--

COPY public.admin_users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: kib
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2026-02-23 01:53:53.257198	2026-02-23 01:53:53.257202
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: kib
--

COPY public.schema_migrations (version) FROM stdin;
20260223015349
20260223015402
\.


--
-- Data for Name: visits; Type: TABLE DATA; Schema: public; Owner: kib
--

COPY public.visits (id, name, phone, keluhan, visit_date, created_at, updated_at) FROM stdin;
8	w	ww	w	2026-02-26	2026-02-26 12:01:45.219461	2026-02-26 12:01:45.219461
9	lilis	087878787878	asam urat\n	2026-02-26	2026-02-26 12:15:38.633552	2026-02-26 12:15:38.633552
\.


--
-- Name: admin_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kib
--

SELECT pg_catalog.setval('public.admin_users_id_seq', 1, false);


--
-- Name: visits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kib
--

SELECT pg_catalog.setval('public.visits_id_seq', 9, true);


--
-- Name: admin_users admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: kib
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: kib
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: kib
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: visits visits_pkey; Type: CONSTRAINT; Schema: public; Owner: kib
--

ALTER TABLE ONLY public.visits
    ADD CONSTRAINT visits_pkey PRIMARY KEY (id);


--
-- Name: index_admin_users_on_email; Type: INDEX; Schema: public; Owner: kib
--

CREATE UNIQUE INDEX index_admin_users_on_email ON public.admin_users USING btree (email);


--
-- Name: index_admin_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: kib
--

CREATE UNIQUE INDEX index_admin_users_on_reset_password_token ON public.admin_users USING btree (reset_password_token);


--
-- PostgreSQL database dump complete
--

\unrestrict Q8tl3KDf7eJffp8KSxk9XG1uOQx3d06p9BXE4PtXvdKSv5eIPUc8Z4VInkU77NO

