--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7 (Ubuntu 14.7-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 15.2

-- Started on 2023-04-21 15:09:49

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
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 210 (class 1259 OID 17251)
-- Name: devices; Type: TABLE; Schema: public; Owner: EXW3L1
--

CREATE TABLE public.devices (
    id bigint NOT NULL,
    status character varying(255),
    type character varying(255),
    employee_id bigint
);


ALTER TABLE public.devices OWNER TO "EXW3L1";

--
-- TOC entry 209 (class 1259 OID 17250)
-- Name: devices_id_seq; Type: SEQUENCE; Schema: public; Owner: EXW3L1
--

CREATE SEQUENCE public.devices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.devices_id_seq OWNER TO "EXW3L1";

--
-- TOC entry 4021 (class 0 OID 0)
-- Dependencies: 209
-- Name: devices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: EXW3L1
--

ALTER SEQUENCE public.devices_id_seq OWNED BY public.devices.id;


--
-- TOC entry 212 (class 1259 OID 17260)
-- Name: employees; Type: TABLE; Schema: public; Owner: EXW3L1
--

CREATE TABLE public.employees (
    id bigint NOT NULL,
    email character varying(255) NOT NULL,
    firsname character varying(255) NOT NULL,
    lastname character varying(255) NOT NULL,
    username character varying(255) NOT NULL
);


ALTER TABLE public.employees OWNER TO "EXW3L1";

--
-- TOC entry 211 (class 1259 OID 17259)
-- Name: employees_id_seq; Type: SEQUENCE; Schema: public; Owner: EXW3L1
--

CREATE SEQUENCE public.employees_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employees_id_seq OWNER TO "EXW3L1";

--
-- TOC entry 4022 (class 0 OID 0)
-- Dependencies: 211
-- Name: employees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: EXW3L1
--

ALTER SEQUENCE public.employees_id_seq OWNED BY public.employees.id;


--
-- TOC entry 214 (class 1259 OID 17279)
-- Name: roles; Type: TABLE; Schema: public; Owner: EXW3L1
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    role_name character varying(255)
);


ALTER TABLE public.roles OWNER TO "EXW3L1";

--
-- TOC entry 213 (class 1259 OID 17278)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: EXW3L1
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO "EXW3L1";

--
-- TOC entry 4023 (class 0 OID 0)
-- Dependencies: 213
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: EXW3L1
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- TOC entry 216 (class 1259 OID 17286)
-- Name: users; Type: TABLE; Schema: public; Owner: EXW3L1
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying(255) NOT NULL,
    name character varying(255),
    password character varying(255) NOT NULL,
    username character varying(255) NOT NULL
);


ALTER TABLE public.users OWNER TO "EXW3L1";

--
-- TOC entry 215 (class 1259 OID 17285)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: EXW3L1
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO "EXW3L1";

--
-- TOC entry 4024 (class 0 OID 0)
-- Dependencies: 215
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: EXW3L1
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 217 (class 1259 OID 17294)
-- Name: users_roles; Type: TABLE; Schema: public; Owner: EXW3L1
--

CREATE TABLE public.users_roles (
    user_id bigint NOT NULL,
    role_id bigint NOT NULL
);


ALTER TABLE public.users_roles OWNER TO "EXW3L1";

--
-- TOC entry 3838 (class 2604 OID 17254)
-- Name: devices id; Type: DEFAULT; Schema: public; Owner: EXW3L1
--

ALTER TABLE ONLY public.devices ALTER COLUMN id SET DEFAULT nextval('public.devices_id_seq'::regclass);


--
-- TOC entry 3839 (class 2604 OID 17263)
-- Name: employees id; Type: DEFAULT; Schema: public; Owner: EXW3L1
--

ALTER TABLE ONLY public.employees ALTER COLUMN id SET DEFAULT nextval('public.employees_id_seq'::regclass);


--
-- TOC entry 3840 (class 2604 OID 17282)
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: EXW3L1
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- TOC entry 3841 (class 2604 OID 17289)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: EXW3L1
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 4007 (class 0 OID 17251)
-- Dependencies: 210
-- Data for Name: devices; Type: TABLE DATA; Schema: public; Owner: EXW3L1
--

COPY public.devices (id, status, type, employee_id) FROM stdin;
1	AVAILABLE	SMARTPHONE	\N
3	OUTOFORDER	LAPTOP	\N
4	MAINTENANCE	LAPTOP	\N
5	OUTOFORDER	TABLET	\N
8	OUTOFORDER	SMARTPHONE	\N
9	OUTOFORDER	LAPTOP	\N
10	MAINTENANCE	SMARTPHONE	\N
11	AVAILABLE	LAPTOP	\N
12	MAINTENANCE	LAPTOP	\N
13	MAINTENANCE	LAPTOP	\N
14	AVAILABLE	SMARTPHONE	\N
15	AVAILABLE	LAPTOP	\N
16	MAINTENANCE	TABLET	\N
17	OUTOFORDER	SMARTPHONE	\N
18	OUTOFORDER	SMARTPHONE	\N
19	AVAILABLE	SMARTPHONE	\N
20	MAINTENANCE	TABLET	\N
21	AVAILABLE	TABLET	\N
22	MAINTENANCE	SMARTPHONE	\N
23	MAINTENANCE	LAPTOP	\N
24	AVAILABLE	SMARTPHONE	\N
25	AVAILABLE	TABLET	\N
26	AVAILABLE	LAPTOP	\N
27	MAINTENANCE	SMARTPHONE	\N
28	AVAILABLE	TABLET	\N
29	AVAILABLE	LAPTOP	\N
30	AVAILABLE	SMARTPHONE	\N
31	AVAILABLE	TABLET	\N
32	AVAILABLE	TABLET	\N
33	OUTOFORDER	SMARTPHONE	\N
34	AVAILABLE	LAPTOP	\N
35	AVAILABLE	TABLET	\N
36	AVAILABLE	LAPTOP	\N
37	OUTOFORDER	LAPTOP	\N
38	MAINTENANCE	TABLET	\N
39	OUTOFORDER	TABLET	\N
40	AVAILABLE	SMARTPHONE	\N
41	OUTOFORDER	TABLET	\N
42	OUTOFORDER	LAPTOP	\N
43	MAINTENANCE	LAPTOP	\N
44	MAINTENANCE	TABLET	\N
45	AVAILABLE	SMARTPHONE	\N
46	MAINTENANCE	LAPTOP	\N
47	MAINTENANCE	TABLET	\N
48	MAINTENANCE	SMARTPHONE	\N
49	OUTOFORDER	TABLET	\N
50	AVAILABLE	TABLET	\N
51	AVAILABLE	SMARTPHONE	\N
52	AVAILABLE	TABLET	\N
7	ASSIGNED	LAPTOP	12
2	ASSIGNED	TABLET	12
\.


--
-- TOC entry 4009 (class 0 OID 17260)
-- Dependencies: 212
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: EXW3L1
--

COPY public.employees (id, email, firsname, lastname, username) FROM stdin;
11	l.greco@example.com	Lorenzo	Greco	l.greco
12	m.costantin@example.com	Maggiore	Costantin	m.costantin
13	s.pellegrini@example.com	Siro	Pellegrini	s.pellegrini
14	a.barbieri@example.com	Alessio	Barbieri	a.barbieri
15	n.palumbo@example.com	Nunzia	Palumbo	n.palumbo
16	g.montanari@example.com	Gelsomina	Montanari	g.montanari
17	g.gallo@example.com	Gianantonio	Gallo	g.gallo
18	i.parisi@example.com	Ilario	Parisi	i.parisi
22	i.monti@example.com	Iacopo	Monti	i.monti
23	s.d'amico@example.com	Sabatino	D'amico	s.d'amico
24	d.palmieri@example.com	Damiana	Palmieri	d.palmieri
25	b.d'angelo@example.com	Bettino	D'angelo	b.d'angelo
26	g.sanna@example.com	Gregorio	Sanna	g.sanna
27	a.bianchi@example.com	Amerigo	Bianchi	a.bianchi
28	p.costa@example.com	Pietro	Costa	p.costa
29	m.de luca@example.com	Mirco	De luca	m.de luca
30	n.damico@example.com	Noemi	Damico	n.damico
20	noemi.barone@example.com	Noemi	Barone	baronessano
31	vincemaio@example.com	Vins	Maj	vm93Bis
\.


--
-- TOC entry 4011 (class 0 OID 17279)
-- Dependencies: 214
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: EXW3L1
--

COPY public.roles (id, role_name) FROM stdin;
1	ROLE_USER
3	ROLE_ADMIN
\.


--
-- TOC entry 4013 (class 0 OID 17286)
-- Dependencies: 216
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: EXW3L1
--

COPY public.users (id, email, name, password, username) FROM stdin;
1	vincenzomaiorana@gmail.com	Vincenzo	$2a$10$r7vtPqlKKIjk0ox.cF/28OHHwKF286e9oEsH1R1jEKg7.uZglrHJm	vm93
2	info@vincenzomaiorana.it	Vincenzo	$2a$10$IHCyyDuF9DJZVoRNb7ZCoe.W7ptuHm4Ixr3UJTnEs/M0q3oNKzgAS	user93
\.


--
-- TOC entry 4014 (class 0 OID 17294)
-- Dependencies: 217
-- Data for Name: users_roles; Type: TABLE DATA; Schema: public; Owner: EXW3L1
--

COPY public.users_roles (user_id, role_id) FROM stdin;
1	3
2	1
\.


--
-- TOC entry 4025 (class 0 OID 0)
-- Dependencies: 209
-- Name: devices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: EXW3L1
--

SELECT pg_catalog.setval('public.devices_id_seq', 52, true);


--
-- TOC entry 4026 (class 0 OID 0)
-- Dependencies: 211
-- Name: employees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: EXW3L1
--

SELECT pg_catalog.setval('public.employees_id_seq', 31, true);


--
-- TOC entry 4027 (class 0 OID 0)
-- Dependencies: 213
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: EXW3L1
--

SELECT pg_catalog.setval('public.roles_id_seq', 5, true);


--
-- TOC entry 4028 (class 0 OID 0)
-- Dependencies: 215
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: EXW3L1
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- TOC entry 3843 (class 2606 OID 17258)
-- Name: devices devices_pkey; Type: CONSTRAINT; Schema: public; Owner: EXW3L1
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_pkey PRIMARY KEY (id);


--
-- TOC entry 3845 (class 2606 OID 17267)
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: EXW3L1
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);


--
-- TOC entry 3851 (class 2606 OID 17284)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: EXW3L1
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 3853 (class 2606 OID 17316)
-- Name: users uk6dotkott2kjsp8vw4d0m25fb7; Type: CONSTRAINT; Schema: public; Owner: EXW3L1
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uk6dotkott2kjsp8vw4d0m25fb7 UNIQUE (email);


--
-- TOC entry 3847 (class 2606 OID 17271)
-- Name: employees uk_3gqbimdf7fckjbwt1kcud141m; Type: CONSTRAINT; Schema: public; Owner: EXW3L1
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT uk_3gqbimdf7fckjbwt1kcud141m UNIQUE (username);


--
-- TOC entry 3855 (class 2606 OID 17300)
-- Name: users uk_6dotkott2kjsp8vw4d0m25fb7; Type: CONSTRAINT; Schema: public; Owner: EXW3L1
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uk_6dotkott2kjsp8vw4d0m25fb7 UNIQUE (email);


--
-- TOC entry 3849 (class 2606 OID 17269)
-- Name: employees uk_j9xgmd0ya5jmus09o0b8pqrpb; Type: CONSTRAINT; Schema: public; Owner: EXW3L1
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT uk_j9xgmd0ya5jmus09o0b8pqrpb UNIQUE (email);


--
-- TOC entry 3857 (class 2606 OID 17302)
-- Name: users uk_r43af9ap4edm43mmtq01oddj6; Type: CONSTRAINT; Schema: public; Owner: EXW3L1
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uk_r43af9ap4edm43mmtq01oddj6 UNIQUE (username);


--
-- TOC entry 3859 (class 2606 OID 17314)
-- Name: users ukr43af9ap4edm43mmtq01oddj6; Type: CONSTRAINT; Schema: public; Owner: EXW3L1
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT ukr43af9ap4edm43mmtq01oddj6 UNIQUE (username);


--
-- TOC entry 3861 (class 2606 OID 17293)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: EXW3L1
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3863 (class 2606 OID 17298)
-- Name: users_roles users_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: EXW3L1
--

ALTER TABLE ONLY public.users_roles
    ADD CONSTRAINT users_roles_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 3865 (class 2606 OID 17308)
-- Name: users_roles fk2o0jvgh89lemvvo17cbqvdxaa; Type: FK CONSTRAINT; Schema: public; Owner: EXW3L1
--

ALTER TABLE ONLY public.users_roles
    ADD CONSTRAINT fk2o0jvgh89lemvvo17cbqvdxaa FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3866 (class 2606 OID 17303)
-- Name: users_roles fkj6m8fwv7oqv74fcehir1a9ffy; Type: FK CONSTRAINT; Schema: public; Owner: EXW3L1
--

ALTER TABLE ONLY public.users_roles
    ADD CONSTRAINT fkj6m8fwv7oqv74fcehir1a9ffy FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- TOC entry 3864 (class 2606 OID 17272)
-- Name: devices fkmflbwgq59nl79en8rjs8tsd3g; Type: FK CONSTRAINT; Schema: public; Owner: EXW3L1
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT fkmflbwgq59nl79en8rjs8tsd3g FOREIGN KEY (employee_id) REFERENCES public.employees(id);


--
-- TOC entry 4020 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2023-04-21 15:09:49

--
-- PostgreSQL database dump complete
--

