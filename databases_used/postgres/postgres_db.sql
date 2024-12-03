--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

-- Started on 2024-12-03 17:09:23

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
-- TOC entry 220 (class 1259 OID 16825)
-- Name: actor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.actor (
    id integer NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    birthday date NOT NULL,
    sex character varying(10),
    CONSTRAINT actor_sex_check CHECK (((sex)::text = ANY ((ARRAY['male'::character varying, 'female'::character varying])::text[])))
);


ALTER TABLE public.actor OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16824)
-- Name: actor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.actor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.actor_id_seq OWNER TO postgres;

--
-- TOC entry 4866 (class 0 OID 0)
-- Dependencies: 219
-- Name: actor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.actor_id_seq OWNED BY public.actor.id;


--
-- TOC entry 218 (class 1259 OID 16813)
-- Name: film; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.film (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    release_date date NOT NULL,
    genre_id integer
);


ALTER TABLE public.film OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16812)
-- Name: film_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.film_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.film_id_seq OWNER TO postgres;

--
-- TOC entry 4868 (class 0 OID 0)
-- Dependencies: 217
-- Name: film_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.film_id_seq OWNED BY public.film.id;


--
-- TOC entry 216 (class 1259 OID 16806)
-- Name: genre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genre (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.genre OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16805)
-- Name: genre_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.genre_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.genre_id_seq OWNER TO postgres;

--
-- TOC entry 4870 (class 0 OID 0)
-- Dependencies: 215
-- Name: genre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.genre_id_seq OWNED BY public.genre.id;


--
-- TOC entry 4701 (class 2604 OID 16828)
-- Name: actor id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actor ALTER COLUMN id SET DEFAULT nextval('public.actor_id_seq'::regclass);


--
-- TOC entry 4700 (class 2604 OID 16816)
-- Name: film id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film ALTER COLUMN id SET DEFAULT nextval('public.film_id_seq'::regclass);


--
-- TOC entry 4699 (class 2604 OID 16809)
-- Name: genre id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre ALTER COLUMN id SET DEFAULT nextval('public.genre_id_seq'::regclass);


--
-- TOC entry 4858 (class 0 OID 16825)
-- Dependencies: 220
-- Data for Name: actor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.actor (id, first_name, last_name, birthday, sex) FROM stdin;
1	Leonardo	DiCaprio	1974-11-11	male
2	Al	Pacino	1940-04-25	male
3	Christian	Bale	1974-01-30	male
4	John	Travolta	1954-02-18	male
5	Elijah	Wood	1981-01-28	male
6	Brad	Pitt	1963-12-18	male
7	Tom	Hanks	1956-07-09	male
8	Keanu	Reeves	1964-09-02	male
9	Robert	Downey Jr.	1965-04-04	male
10	Kate	Winslet	1975-10-05	female
11	Sam	Neill	1947-09-14	male
12	Mark	Hamill	1951-09-25	male
13	Jodie	Foster	1962-11-19	female
14	Liam	Neeson	1952-06-07	male
15	Tom	Sizemore	1961-11-29	male
16	Tim	Robbins	1958-10-16	male
17	Russell	Crowe	1964-04-07	male
18	Mel	Gibson	1956-01-03	male
19	Sigourney	Weaver	1949-10-08	female
20	Arnold	Schwarzenegger	1947-07-30	male
\.


--
-- TOC entry 4856 (class 0 OID 16813)
-- Dependencies: 218
-- Data for Name: film; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.film (id, name, release_date, genre_id) FROM stdin;
1	Inception	2010-07-16	6
2	The Godfather	1972-03-24	1
3	The Dark Knight	2008-07-18	4
4	Pulp Fiction	1994-10-14	1
5	The Lord of the Rings: The Return of the King	2003-12-17	5
6	Fight Club	1999-10-15	1
7	Forrest Gump	1994-07-06	1
8	The Matrix	1999-03-31	6
9	The Avengers	2012-05-04	4
10	Titanic	1997-12-19	1
11	Jurassic Park	1993-06-11	5
12	Star Wars: Episode IV - A New Hope	1977-05-25	5
13	The Silence of the Lambs	1991-02-14	2
15	Saving Private Ryan	1998-07-24	4
16	The Shawshank Redemption	1994-09-23	1
17	Gladiator	2000-05-05	4
18	Braveheart	1995-05-24	4
19	Alien	1979-05-25	2
20	Terminator 2: Judgment Day	1991-07-03	4
14	Schindler's List	1993-11-30	1
\.


--
-- TOC entry 4854 (class 0 OID 16806)
-- Dependencies: 216
-- Data for Name: genre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.genre (id, name) FROM stdin;
1	Drama
2	Horror
3	Comedy
4	Action
5	Adventure
6	Fiction
\.


--
-- TOC entry 4871 (class 0 OID 0)
-- Dependencies: 219
-- Name: actor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.actor_id_seq', 20, true);


--
-- TOC entry 4872 (class 0 OID 0)
-- Dependencies: 217
-- Name: film_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.film_id_seq', 20, true);


--
-- TOC entry 4873 (class 0 OID 0)
-- Dependencies: 215
-- Name: genre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.genre_id_seq', 6, true);


--
-- TOC entry 4708 (class 2606 OID 16833)
-- Name: actor actor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actor
    ADD CONSTRAINT actor_pkey PRIMARY KEY (id);


--
-- TOC entry 4706 (class 2606 OID 16818)
-- Name: film film_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film
    ADD CONSTRAINT film_pkey PRIMARY KEY (id);


--
-- TOC entry 4704 (class 2606 OID 16811)
-- Name: genre genre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (id);


--
-- TOC entry 4709 (class 2606 OID 16819)
-- Name: film film_genre_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film
    ADD CONSTRAINT film_genre_id_fkey FOREIGN KEY (genre_id) REFERENCES public.genre(id);


--
-- TOC entry 4864 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT USAGE ON SCHEMA public TO driss;


--
-- TOC entry 4865 (class 0 OID 0)
-- Dependencies: 220
-- Name: TABLE actor; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.actor TO driss;


--
-- TOC entry 4867 (class 0 OID 0)
-- Dependencies: 218
-- Name: TABLE film; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.film TO driss;


--
-- TOC entry 4869 (class 0 OID 0)
-- Dependencies: 216
-- Name: TABLE genre; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.genre TO driss;


--
-- TOC entry 2048 (class 826 OID 16834)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT SELECT ON TABLES TO driss;


-- Completed on 2024-12-03 17:09:23

--
-- PostgreSQL database dump complete
--

