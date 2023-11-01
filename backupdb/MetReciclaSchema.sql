--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-10-27 13:56:17

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
-- TOC entry 3360 (class 1262 OID 180963)
-- Name: metrecicla; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE metrecicla WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Paraguay.1252';


\connect metrecicla

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

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 197357)
-- Name: chatarra; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.chatarra (
    idchatarra integer NOT NULL,
    nombre character varying(255),
    precio numeric(10,2)
);


--
-- TOC entry 214 (class 1259 OID 197356)
-- Name: chatarra_idchatarra_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.chatarra_idchatarra_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3361 (class 0 OID 0)
-- Dependencies: 214
-- Name: chatarra_idchatarra_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.chatarra_idchatarra_seq OWNED BY public.chatarra.idchatarra;


--
-- TOC entry 223 (class 1259 OID 230345)
-- Name: detallesticket; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.detallesticket (
    iddetalle integer NOT NULL,
    idchatarra integer,
    idticket integer,
    cantidad numeric(10,2),
    subtotal numeric(10,2),
    idvendedor integer
);


--
-- TOC entry 222 (class 1259 OID 230344)
-- Name: detallesticket_iddetalle_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.detallesticket_iddetalle_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3362 (class 0 OID 0)
-- Dependencies: 222
-- Name: detallesticket_iddetalle_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.detallesticket_iddetalle_seq OWNED BY public.detallesticket.iddetalle;


--
-- TOC entry 219 (class 1259 OID 230299)
-- Name: ticket; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ticket (
    idticket integer NOT NULL,
    fecha date,
    idvendedor integer
);


--
-- TOC entry 218 (class 1259 OID 230298)
-- Name: ticket_idticket_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ticket_idticket_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3363 (class 0 OID 0)
-- Dependencies: 218
-- Name: ticket_idticket_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ticket_idticket_seq OWNED BY public.ticket.idticket;


--
-- TOC entry 221 (class 1259 OID 230311)
-- Name: total; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.total (
    idtotal integer NOT NULL,
    idticket integer,
    total integer
);


--
-- TOC entry 220 (class 1259 OID 230310)
-- Name: total_idtotal_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.total_idtotal_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3364 (class 0 OID 0)
-- Dependencies: 220
-- Name: total_idtotal_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.total_idtotal_seq OWNED BY public.total.idtotal;


--
-- TOC entry 217 (class 1259 OID 230290)
-- Name: vendedores; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vendedores (
    idvendedor integer NOT NULL,
    nombre character varying(255),
    telefono character varying(20),
    direccion character varying(255)
);


--
-- TOC entry 216 (class 1259 OID 230289)
-- Name: vendedores_idvendedor_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vendedores_idvendedor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3365 (class 0 OID 0)
-- Dependencies: 216
-- Name: vendedores_idvendedor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vendedores_idvendedor_seq OWNED BY public.vendedores.idvendedor;


--
-- TOC entry 3193 (class 2604 OID 197360)
-- Name: chatarra idchatarra; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chatarra ALTER COLUMN idchatarra SET DEFAULT nextval('public.chatarra_idchatarra_seq'::regclass);


--
-- TOC entry 3197 (class 2604 OID 230348)
-- Name: detallesticket iddetalle; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.detallesticket ALTER COLUMN iddetalle SET DEFAULT nextval('public.detallesticket_iddetalle_seq'::regclass);


--
-- TOC entry 3195 (class 2604 OID 230302)
-- Name: ticket idticket; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ticket ALTER COLUMN idticket SET DEFAULT nextval('public.ticket_idticket_seq'::regclass);


--
-- TOC entry 3196 (class 2604 OID 230314)
-- Name: total idtotal; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.total ALTER COLUMN idtotal SET DEFAULT nextval('public.total_idtotal_seq'::regclass);


--
-- TOC entry 3194 (class 2604 OID 230293)
-- Name: vendedores idvendedor; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vendedores ALTER COLUMN idvendedor SET DEFAULT nextval('public.vendedores_idvendedor_seq'::regclass);


--
-- TOC entry 3199 (class 2606 OID 197362)
-- Name: chatarra chatarra_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chatarra
    ADD CONSTRAINT chatarra_pkey PRIMARY KEY (idchatarra);


--
-- TOC entry 3207 (class 2606 OID 230350)
-- Name: detallesticket detallesticket_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.detallesticket
    ADD CONSTRAINT detallesticket_pkey PRIMARY KEY (iddetalle);


--
-- TOC entry 3203 (class 2606 OID 230304)
-- Name: ticket ticket_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_pkey PRIMARY KEY (idticket);


--
-- TOC entry 3205 (class 2606 OID 230316)
-- Name: total total_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.total
    ADD CONSTRAINT total_pkey PRIMARY KEY (idtotal);


--
-- TOC entry 3201 (class 2606 OID 230297)
-- Name: vendedores vendedores_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vendedores
    ADD CONSTRAINT vendedores_pkey PRIMARY KEY (idvendedor);


--
-- TOC entry 3210 (class 2606 OID 230351)
-- Name: detallesticket detallesticket_idchatarra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.detallesticket
    ADD CONSTRAINT detallesticket_idchatarra_fkey FOREIGN KEY (idchatarra) REFERENCES public.chatarra(idchatarra);


--
-- TOC entry 3211 (class 2606 OID 230356)
-- Name: detallesticket detallesticket_idticket_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.detallesticket
    ADD CONSTRAINT detallesticket_idticket_fkey FOREIGN KEY (idticket) REFERENCES public.ticket(idticket);


--
-- TOC entry 3212 (class 2606 OID 230361)
-- Name: detallesticket fkho7e7nhb8b5u5rhqrlo2gdl7w; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.detallesticket
    ADD CONSTRAINT fkho7e7nhb8b5u5rhqrlo2gdl7w FOREIGN KEY (idvendedor) REFERENCES public.vendedores(idvendedor);


--
-- TOC entry 3208 (class 2606 OID 230305)
-- Name: ticket ticket_idvendedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_idvendedor_fkey FOREIGN KEY (idvendedor) REFERENCES public.vendedores(idvendedor);


--
-- TOC entry 3209 (class 2606 OID 230317)
-- Name: total total_idticket_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.total
    ADD CONSTRAINT total_idticket_fkey FOREIGN KEY (idticket) REFERENCES public.ticket(idticket);


-- Completed on 2023-10-27 13:56:17

--
-- PostgreSQL database dump complete
--

