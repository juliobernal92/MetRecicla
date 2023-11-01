--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-10-31 11:24:34

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
-- TOC entry 215 (class 1259 OID 197357)
-- Name: chatarra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chatarra (
    idchatarra integer NOT NULL,
    nombre character varying(255),
    precio numeric(10,2)
);


ALTER TABLE public.chatarra OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 197356)
-- Name: chatarra_idchatarra_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.chatarra_idchatarra_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chatarra_idchatarra_seq OWNER TO postgres;

--
-- TOC entry 3405 (class 0 OID 0)
-- Dependencies: 214
-- Name: chatarra_idchatarra_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chatarra_idchatarra_seq OWNED BY public.chatarra.idchatarra;


--
-- TOC entry 223 (class 1259 OID 230345)
-- Name: detallesticket; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detallesticket (
    iddetalle integer NOT NULL,
    idchatarra integer,
    idticket integer,
    cantidad numeric(10,2),
    subtotal numeric(10,2),
    idvendedor integer
);


ALTER TABLE public.detallesticket OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 230344)
-- Name: detallesticket_iddetalle_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.detallesticket_iddetalle_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.detallesticket_iddetalle_seq OWNER TO postgres;

--
-- TOC entry 3406 (class 0 OID 0)
-- Dependencies: 222
-- Name: detallesticket_iddetalle_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.detallesticket_iddetalle_seq OWNED BY public.detallesticket.iddetalle;


--
-- TOC entry 233 (class 1259 OID 255408)
-- Name: detallesventas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detallesventas (
    iddetalleventa integer NOT NULL,
    idepreciolocal integer NOT NULL,
    idventaticket integer NOT NULL,
    cantidad integer NOT NULL,
    subtotal numeric(10,2) NOT NULL
);


ALTER TABLE public.detallesventas OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 255407)
-- Name: detallesventas_iddetalleventa_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.detallesventas_iddetalleventa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.detallesventas_iddetalleventa_seq OWNER TO postgres;

--
-- TOC entry 3407 (class 0 OID 0)
-- Dependencies: 232
-- Name: detallesventas_iddetalleventa_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.detallesventas_iddetalleventa_seq OWNED BY public.detallesventas.iddetalleventa;


--
-- TOC entry 225 (class 1259 OID 255363)
-- Name: localesventas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.localesventas (
    idlocal integer NOT NULL,
    nombre character varying(255) NOT NULL,
    direccion character varying(255) NOT NULL,
    telefono character varying(20)
);


ALTER TABLE public.localesventas OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 255362)
-- Name: localesventas_idlocal_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.localesventas_idlocal_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.localesventas_idlocal_seq OWNER TO postgres;

--
-- TOC entry 3408 (class 0 OID 0)
-- Dependencies: 224
-- Name: localesventas_idlocal_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.localesventas_idlocal_seq OWNED BY public.localesventas.idlocal;


--
-- TOC entry 227 (class 1259 OID 255372)
-- Name: preciolocal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.preciolocal (
    idpreciolocal integer NOT NULL,
    idlocal integer NOT NULL,
    idchatarra integer NOT NULL,
    preciolocal numeric(10,2) NOT NULL
);


ALTER TABLE public.preciolocal OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 255371)
-- Name: preciolocal_idpreciolocal_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.preciolocal_idpreciolocal_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.preciolocal_idpreciolocal_seq OWNER TO postgres;

--
-- TOC entry 3409 (class 0 OID 0)
-- Dependencies: 226
-- Name: preciolocal_idpreciolocal_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.preciolocal_idpreciolocal_seq OWNED BY public.preciolocal.idpreciolocal;


--
-- TOC entry 219 (class 1259 OID 230299)
-- Name: ticket; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ticket (
    idticket integer NOT NULL,
    fecha date,
    idvendedor integer
);


ALTER TABLE public.ticket OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 230298)
-- Name: ticket_idticket_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ticket_idticket_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ticket_idticket_seq OWNER TO postgres;

--
-- TOC entry 3410 (class 0 OID 0)
-- Dependencies: 218
-- Name: ticket_idticket_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ticket_idticket_seq OWNED BY public.ticket.idticket;


--
-- TOC entry 221 (class 1259 OID 230311)
-- Name: total; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.total (
    idtotal integer NOT NULL,
    idticket integer,
    total integer
);


ALTER TABLE public.total OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 230310)
-- Name: total_idtotal_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.total_idtotal_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.total_idtotal_seq OWNER TO postgres;

--
-- TOC entry 3411 (class 0 OID 0)
-- Dependencies: 220
-- Name: total_idtotal_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.total_idtotal_seq OWNED BY public.total.idtotal;


--
-- TOC entry 231 (class 1259 OID 255396)
-- Name: totalventa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.totalventa (
    idtotalventa integer NOT NULL,
    idventaticket integer NOT NULL,
    totalventa numeric(10,2) NOT NULL,
    totalganancia numeric(10,2) NOT NULL
);


ALTER TABLE public.totalventa OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 255395)
-- Name: totalventa_idtotalventa_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.totalventa_idtotalventa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.totalventa_idtotalventa_seq OWNER TO postgres;

--
-- TOC entry 3412 (class 0 OID 0)
-- Dependencies: 230
-- Name: totalventa_idtotalventa_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.totalventa_idtotalventa_seq OWNED BY public.totalventa.idtotalventa;


--
-- TOC entry 217 (class 1259 OID 230290)
-- Name: vendedores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vendedores (
    idvendedor integer NOT NULL,
    nombre character varying(255),
    telefono character varying(20),
    direccion character varying(255)
);


ALTER TABLE public.vendedores OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 230289)
-- Name: vendedores_idvendedor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vendedores_idvendedor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vendedores_idvendedor_seq OWNER TO postgres;

--
-- TOC entry 3413 (class 0 OID 0)
-- Dependencies: 216
-- Name: vendedores_idvendedor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendedores_idvendedor_seq OWNED BY public.vendedores.idvendedor;


--
-- TOC entry 229 (class 1259 OID 255389)
-- Name: ventasticket; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ventasticket (
    idventaticket integer NOT NULL,
    idempleado integer NOT NULL,
    fecha date NOT NULL
);


ALTER TABLE public.ventasticket OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 255388)
-- Name: ventasticket_idventaticket_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ventasticket_idventaticket_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ventasticket_idventaticket_seq OWNER TO postgres;

--
-- TOC entry 3414 (class 0 OID 0)
-- Dependencies: 228
-- Name: ventasticket_idventaticket_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ventasticket_idventaticket_seq OWNED BY public.ventasticket.idventaticket;


--
-- TOC entry 3218 (class 2604 OID 197360)
-- Name: chatarra idchatarra; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chatarra ALTER COLUMN idchatarra SET DEFAULT nextval('public.chatarra_idchatarra_seq'::regclass);


--
-- TOC entry 3222 (class 2604 OID 230348)
-- Name: detallesticket iddetalle; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detallesticket ALTER COLUMN iddetalle SET DEFAULT nextval('public.detallesticket_iddetalle_seq'::regclass);


--
-- TOC entry 3227 (class 2604 OID 255411)
-- Name: detallesventas iddetalleventa; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detallesventas ALTER COLUMN iddetalleventa SET DEFAULT nextval('public.detallesventas_iddetalleventa_seq'::regclass);


--
-- TOC entry 3223 (class 2604 OID 255366)
-- Name: localesventas idlocal; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.localesventas ALTER COLUMN idlocal SET DEFAULT nextval('public.localesventas_idlocal_seq'::regclass);


--
-- TOC entry 3224 (class 2604 OID 255375)
-- Name: preciolocal idpreciolocal; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.preciolocal ALTER COLUMN idpreciolocal SET DEFAULT nextval('public.preciolocal_idpreciolocal_seq'::regclass);


--
-- TOC entry 3220 (class 2604 OID 230302)
-- Name: ticket idticket; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket ALTER COLUMN idticket SET DEFAULT nextval('public.ticket_idticket_seq'::regclass);


--
-- TOC entry 3221 (class 2604 OID 230314)
-- Name: total idtotal; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.total ALTER COLUMN idtotal SET DEFAULT nextval('public.total_idtotal_seq'::regclass);


--
-- TOC entry 3226 (class 2604 OID 255399)
-- Name: totalventa idtotalventa; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.totalventa ALTER COLUMN idtotalventa SET DEFAULT nextval('public.totalventa_idtotalventa_seq'::regclass);


--
-- TOC entry 3219 (class 2604 OID 230293)
-- Name: vendedores idvendedor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendedores ALTER COLUMN idvendedor SET DEFAULT nextval('public.vendedores_idvendedor_seq'::regclass);


--
-- TOC entry 3225 (class 2604 OID 255392)
-- Name: ventasticket idventaticket; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventasticket ALTER COLUMN idventaticket SET DEFAULT nextval('public.ventasticket_idventaticket_seq'::regclass);


--
-- TOC entry 3229 (class 2606 OID 197362)
-- Name: chatarra chatarra_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chatarra
    ADD CONSTRAINT chatarra_pkey PRIMARY KEY (idchatarra);


--
-- TOC entry 3237 (class 2606 OID 230350)
-- Name: detallesticket detallesticket_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detallesticket
    ADD CONSTRAINT detallesticket_pkey PRIMARY KEY (iddetalle);


--
-- TOC entry 3247 (class 2606 OID 255413)
-- Name: detallesventas detallesventas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detallesventas
    ADD CONSTRAINT detallesventas_pkey PRIMARY KEY (iddetalleventa);


--
-- TOC entry 3239 (class 2606 OID 255370)
-- Name: localesventas localesventas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.localesventas
    ADD CONSTRAINT localesventas_pkey PRIMARY KEY (idlocal);


--
-- TOC entry 3241 (class 2606 OID 255377)
-- Name: preciolocal preciolocal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.preciolocal
    ADD CONSTRAINT preciolocal_pkey PRIMARY KEY (idpreciolocal);


--
-- TOC entry 3233 (class 2606 OID 230304)
-- Name: ticket ticket_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_pkey PRIMARY KEY (idticket);


--
-- TOC entry 3235 (class 2606 OID 230316)
-- Name: total total_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.total
    ADD CONSTRAINT total_pkey PRIMARY KEY (idtotal);


--
-- TOC entry 3245 (class 2606 OID 255401)
-- Name: totalventa totalventa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.totalventa
    ADD CONSTRAINT totalventa_pkey PRIMARY KEY (idtotalventa);


--
-- TOC entry 3231 (class 2606 OID 230297)
-- Name: vendedores vendedores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendedores
    ADD CONSTRAINT vendedores_pkey PRIMARY KEY (idvendedor);


--
-- TOC entry 3243 (class 2606 OID 255394)
-- Name: ventasticket ventasticket_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventasticket
    ADD CONSTRAINT ventasticket_pkey PRIMARY KEY (idventaticket);


--
-- TOC entry 3250 (class 2606 OID 230351)
-- Name: detallesticket detallesticket_idchatarra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detallesticket
    ADD CONSTRAINT detallesticket_idchatarra_fkey FOREIGN KEY (idchatarra) REFERENCES public.chatarra(idchatarra);


--
-- TOC entry 3251 (class 2606 OID 230356)
-- Name: detallesticket detallesticket_idticket_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detallesticket
    ADD CONSTRAINT detallesticket_idticket_fkey FOREIGN KEY (idticket) REFERENCES public.ticket(idticket);


--
-- TOC entry 3256 (class 2606 OID 255414)
-- Name: detallesventas detallesventas_idepreciolocal_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detallesventas
    ADD CONSTRAINT detallesventas_idepreciolocal_fkey FOREIGN KEY (idepreciolocal) REFERENCES public.preciolocal(idpreciolocal);


--
-- TOC entry 3257 (class 2606 OID 255419)
-- Name: detallesventas detallesventas_idventaticket_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detallesventas
    ADD CONSTRAINT detallesventas_idventaticket_fkey FOREIGN KEY (idventaticket) REFERENCES public.ventasticket(idventaticket);


--
-- TOC entry 3252 (class 2606 OID 230361)
-- Name: detallesticket fkho7e7nhb8b5u5rhqrlo2gdl7w; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detallesticket
    ADD CONSTRAINT fkho7e7nhb8b5u5rhqrlo2gdl7w FOREIGN KEY (idvendedor) REFERENCES public.vendedores(idvendedor);


--
-- TOC entry 3253 (class 2606 OID 255383)
-- Name: preciolocal preciolocal_idchatarra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.preciolocal
    ADD CONSTRAINT preciolocal_idchatarra_fkey FOREIGN KEY (idchatarra) REFERENCES public.chatarra(idchatarra);


--
-- TOC entry 3254 (class 2606 OID 255378)
-- Name: preciolocal preciolocal_idlocal_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.preciolocal
    ADD CONSTRAINT preciolocal_idlocal_fkey FOREIGN KEY (idlocal) REFERENCES public.localesventas(idlocal);


--
-- TOC entry 3248 (class 2606 OID 230305)
-- Name: ticket ticket_idvendedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_idvendedor_fkey FOREIGN KEY (idvendedor) REFERENCES public.vendedores(idvendedor);


--
-- TOC entry 3249 (class 2606 OID 230317)
-- Name: total total_idticket_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.total
    ADD CONSTRAINT total_idticket_fkey FOREIGN KEY (idticket) REFERENCES public.ticket(idticket);


--
-- TOC entry 3255 (class 2606 OID 255402)
-- Name: totalventa totalventa_idventaticket_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.totalventa
    ADD CONSTRAINT totalventa_idventaticket_fkey FOREIGN KEY (idventaticket) REFERENCES public.ventasticket(idventaticket);


-- Completed on 2023-10-31 11:24:34

--
-- PostgreSQL database dump complete
--

