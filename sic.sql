--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.20
-- Dumped by pg_dump version 12.0

-- Started on 2019-12-11 11:19:02 -05

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
-- TOC entry 1 (class 3079 OID 16384)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 2277 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

--
-- TOC entry 174 (class 1259 OID 405137)
-- Name: encuesta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.encuesta (
    nro_documento integer NOT NULL,
    email character varying(1000),
    comentarios character varying(1000) NOT NULL,
    id_marca_pc integer,
    fecha_respuesta timestamp with time zone NOT NULL
);


ALTER TABLE public.encuesta OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 405147)
-- Name: marca_pc; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.marca_pc (
    id integer NOT NULL,
    nombre character varying(255)
);


ALTER TABLE public.marca_pc OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 405145)
-- Name: marca_pc_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.marca_pc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.marca_pc_id_seq OWNER TO postgres;

--
-- TOC entry 2278 (class 0 OID 0)
-- Dependencies: 175
-- Name: marca_pc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.marca_pc_id_seq OWNED BY public.marca_pc.id;


--
-- TOC entry 2153 (class 2604 OID 405150)
-- Name: marca_pc id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marca_pc ALTER COLUMN id SET DEFAULT nextval('public.marca_pc_id_seq'::regclass);


--
-- TOC entry 2268 (class 0 OID 405137)
-- Dependencies: 174
-- Data for Name: encuesta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.encuesta (nro_documento, email, comentarios, id_marca_pc, fecha_respuesta) FROM stdin;
7000	adriana.marcela.f@hotmail.com	vzcxv	1	2019-12-11 11:05:39.532-05
9000	carlossarmientor@gmail.com	qeqeq	2	2019-12-11 11:04:24.637-05
90000	adriana.marcela.f@hotmail.com	uoi	3	2019-12-11 11:07:46.854-05
100000	adriana.marcela.f@hotmail.com	prueba	4	2019-12-11 11:02:21.332-05
8000	adriana.marcela.f@hotmail.com	prueba	5	2019-12-11 11:09:00.034-05
10000	adriana.marcela.f@hotmail.com	9000	1	2019-12-11 11:12:28.712-05
\.


--
-- TOC entry 2270 (class 0 OID 405147)
-- Dependencies: 176
-- Data for Name: marca_pc; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.marca_pc (id, nombre) FROM stdin;
1	Apple
2	Dell
3	HP
4	Lenovo
5	Assus
\.


--
-- TOC entry 2279 (class 0 OID 0)
-- Dependencies: 175
-- Name: marca_pc_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.marca_pc_id_seq', 5, true);


--
-- TOC entry 2155 (class 2606 OID 405144)
-- Name: encuesta pk_encuesta; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.encuesta
    ADD CONSTRAINT pk_encuesta PRIMARY KEY (nro_documento);


--
-- TOC entry 2157 (class 2606 OID 405152)
-- Name: marca_pc pk_marca_pc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marca_pc
    ADD CONSTRAINT pk_marca_pc PRIMARY KEY (id);


--
-- TOC entry 2158 (class 2606 OID 405153)
-- Name: encuesta fk_marca_pc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.encuesta
    ADD CONSTRAINT fk_marca_pc FOREIGN KEY (id_marca_pc) REFERENCES public.marca_pc(id);


--
-- TOC entry 2276 (class 0 OID 0)
-- Dependencies: 7
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2019-12-11 11:19:02 -05

--
-- PostgreSQL database dump complete
--

